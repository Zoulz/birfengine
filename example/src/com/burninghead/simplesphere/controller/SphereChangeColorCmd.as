package com.burninghead.simplesphere.controller
{
	import com.burninghead.birf.controller.BaseCommand;
	import com.burninghead.birf.controller.ICommand;
	import com.burninghead.birf.utils.MathUtil;
	import com.burninghead.simplesphere.model.SimpleSphereModelMsgType;
	/**
	 * @author Zoulz
	 */
	public class SphereChangeColorCmd extends BaseCommand implements ICommand
	{
		/**
		 * Execute this command. Randomize a new color and send it to model.
		 */
		public function execute(params:*):void
		{
			//	Get a new random color for the sphere.
			var newColor:uint = MathUtil.randomColor();
			
			//	Simply pass a message to model to update the color.
			_messenger.sendMessage(SimpleSphereModelMsgType.SET_SPHERE_COLOR, { color: newColor });
		}
	}
}
