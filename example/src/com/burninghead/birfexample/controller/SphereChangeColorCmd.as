package com.burninghead.birfexample.controller
{
	import com.burninghead.birf.utils.MathUtil;
	import com.burninghead.birfexample.model.BirfExampleModelMessageType;
	import com.burninghead.birf.controller.ICommand;
	import com.burninghead.birf.controller.BaseCommand;
	/**
	 * @author Zoulz
	 */
	public class SphereChangeColorCmd extends BaseCommand implements ICommand
	{
		public function execute(params:*):void
		{
			//	Get a new random color for the sphere.
			var newColor:uint = MathUtil.randomColor();
			
			//	Simply pass a message to model to update the color.
			_messenger.sendMessage(BirfExampleModelMessageType.SET_SPHERE_COLOR, { color: newColor });
		}
	}
}
