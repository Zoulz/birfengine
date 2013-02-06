package com.burninghead.birf.view.states
{
	/**
	 * @author tomas.augustinovic
	 */
	public class ViewStateTransition
	{
		public var name:String;
		public var target:uint;
		public var params:Object;
		
		public function ViewStateTransition(name:String, target:uint, params:Object)
		{
			this.name = name;
			this.target = target;
			this.params = params;
		}
	}
}
