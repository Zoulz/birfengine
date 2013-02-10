package com.burninghead.birf.view.stage2d.states
{
	import com.burninghead.birf.states.BaseStateMachine;
	import com.burninghead.birf.states.IState;
	import com.burninghead.birf.states.IStateMachine;

	import org.swiftsuspenders.Injector;
	/**
	 * @author Zoulz
	 */
	public class Stage2DStateMachine extends BaseStateMachine implements IStateMachine
	{
		private var _injector:Injector;
		
		public function Stage2DStateMachine(injector:Injector)
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
