package com.burninghead.birf.states
{
	import org.osflash.signals.ISignal;
	import org.osflash.signals.Signal;
	/**
	 * @author tomas.augustinovic
	 */
	public class BaseState implements IState
	{
		private var _transitionSignal:Signal;
		
		public function BaseState()
		{
			_transitionSignal = new Signal();
		}
		
		protected function performTransition(transitionId:Object):void
		{
			if (transitionId != null)
			{
				_transitionSignal.dispatch(this, transitionId);
			}
		}
		
		public function enter():void
		{
		}

		public function exit():void
		{
		}

		public function update():void
		{
		}

		public function get transition():ISignal
		{
			return _transitionSignal;
		}
	}
}
