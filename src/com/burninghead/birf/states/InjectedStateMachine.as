package com.burninghead.birf.states
{
	import org.swiftsuspenders.Injector;
	/**
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
