package com.burninghead.extensions.view.stage2d.comps.console
{
	/**
	 * @author tomas.augustinovic
	 */
	public class AzureConsoleSkin extends DefaultConsoleSkin
	{
		override protected function createGraphics():void
		{
			graphics.beginFill(0xCC006699, 0.7);
			graphics.drawRect(0, this.stage.stageHeight - 20, this.stage.stageWidth, 20);
			graphics.endFill();
			graphics.beginFill(0xCC006699, 0.7);
			graphics.drawRect(0, 0, this.stage.stageWidth, this.stage.stageHeight);
			graphics.endFill();
		}
	}
}
