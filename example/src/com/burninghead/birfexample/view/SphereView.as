package com.burninghead.birfexample.view
{
	import flash.display.Sprite;
	/**
	 * @author Zoulz
	 */
	public class SphereView extends Sprite
	{
		public function SphereView()
		{
			mouseChildren = false;
			buttonMode = true;
			
			setColor(0xff0000);
		}
		
		public function setColor(c:uint):void
		{
			this.graphics.clear();
			this.graphics.beginFill(c, 1);
			this.graphics.drawCircle(0, 0, 25);
			this.graphics.endFill();
		}
	}
}
