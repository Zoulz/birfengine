package com.burninghead.birf.view.states
{
	import com.burninghead.birf.errors.AbstractMethodError;
	import com.burninghead.birf.messaging.IMessageHandler;
	import com.burninghead.birf.messaging.Messenger;
	import com.burninghead.birf.utils.ObjectUtil;

	import org.osflash.signals.ISignal;
	import org.osflash.signals.Signal;

	/**
	 * @author tomas.augustinovic
	 */
	public class BaseViewState
	{
		[Inject] public var messageHandler:IMessageHandler;
		
		private var _changeState:Signal;
		private var _isTransitioning:Boolean;
		protected var _messenger:Messenger;
		protected var _transitions:Object = new Object();
		
		public function BaseViewState()
		{
			_changeState = new Signal();
			_transitions = new Object();
			
			registerTransitions();
		}
		
		[PostConstruct]
		public function postConstruct():void
		{
			_messenger = new Messenger(messageHandler, this);
		}
		
		protected function registerTransitions():void
		{
			throw new AbstractMethodError();
		}
		
		protected function transition(id:String, additionalParams:Object = null):void
		{
			if (_isTransitioning)
			{
				//	Transitioning is a one-off, so only allow one transition to be made.
				return;
			}
			
			if (_transitions[id] != null)
			{
				_isTransitioning = true;
				additionalParams = (additionalParams == null) ? { } : additionalParams;
				
				_changeState.dispatch(_transitions[id].target, ObjectUtil.mergeObjects(_transitions[id].params, additionalParams));
			}
			else
			{
				throw new Error("View state transition error: No transition with ID: " + id + " registered.");
			}
		}
		
		protected function registerTransition(id:String, targetViewState:uint, params:Object):void
		{
			if (_transitions[id] == null)
			{
				_transitions[id] = new Object();
			}
			
			_transitions[id] = { target: targetViewState, params: params };
		}
		
		protected function unregisterTransition(id:String):void
		{
			_transitions[id] = null;
		}
		
		public function get changeState():ISignal
		{
			return _changeState;
		}
		
		public function exit():void
		{
			_isTransitioning = false;
		}
	}
}
