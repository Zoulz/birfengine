package com.burninghead.swarmdemo.states
{
	import com.burninghead.birf.messaging.IMessageHandler;
	import com.burninghead.birf.messaging.messages.BaseMessage;
	import com.burninghead.birf.states.BaseState;
	import com.burninghead.birf.states.IState;
	import com.burninghead.birf.view.IView;
	import com.burninghead.extensions.bitmaprenderer.IBitmapRenderer;
	import com.burninghead.swarmdemo.view.comps.SwarmView;
	import com.burninghead.swarmdemo.view.mediators.SwarmMediator;
	import com.burninghead.swarmdemo.view.mediators.SwarmMediatorMsgType;
	/**
	 * @author tomas.augustinovic
	 */
	public class SwarmViewState extends BaseState implements IState
	{
		[Inject] public var renderer:IBitmapRenderer;
		[Inject] public var view:IView;
		[Inject] public var messageHandler:IMessageHandler;
		
		private var _swarm:SwarmView;
		private var _swarmMediator:SwarmMediator;
		
		public function SwarmViewState()
		{
		}
		
		override public function enter():void
		{
			_swarm = new SwarmView(renderer);
			
			_swarmMediator = view.getMediator(SwarmMediator) as SwarmMediator;
			_swarmMediator.registerView(_swarm);
			
			messageHandler.send(new BaseMessage(SwarmMediatorMsgType.CREATE_ROBINS, this));
		}
		
		override public function exit():void
		{
			_swarmMediator.dispose();
			_swarm.dispose();
		}
	}
}
