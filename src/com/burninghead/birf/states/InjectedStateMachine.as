package com.burninghead.birf.states
{
	import org.swiftsuspenders.Injector;
	/**
	 * Provides a basic state machine with dependency injection. The supplied injector
	 * will inject all of the states added to the state machine.
	 * 
	 * @author tomas.augustinovic
	 */
	public class InjectedStateMachine extends BaseStateMachine implements IStateMachine
	{
		private var _injector:Injector;
		
		public function InjectedStateMachine(injector:Injector)
		{
			super();
			
			_injector = injector;
		}
		
		override public function registerState(id:String, state:IState):void
		{
			super.registerState(id, state);
			
			if (id != null && state != null)
			{
				_injector.injectInto(state);
			}
		}
	}
}
