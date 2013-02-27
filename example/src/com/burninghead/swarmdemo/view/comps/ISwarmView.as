package com.burninghead.swarmdemo.view.comps
{
	import com.burninghead.birf.view.IViewComponent;
	/**
	 * @author tomas.augustinovic
	 */
	public interface ISwarmView extends IViewComponent
	{
		function createRobins(num:uint = 20):void;
	}
}
