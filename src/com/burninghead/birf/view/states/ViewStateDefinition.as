package com.burninghead.birf.view.states
{
	import org.swiftsuspenders.Injector;
	/**
	 * @author BigZoulz
	 */
	public class ViewStateDefinition
	{
		public var index:uint;
		public var State:Class;
		public var injector:Injector;
		
		public function ViewStateDefinition(index:uint, State:Class, injector:Injector = null)
		{
			this.index = index;
			this.State = State;
			this.injector = injector;
		}
	}
}
