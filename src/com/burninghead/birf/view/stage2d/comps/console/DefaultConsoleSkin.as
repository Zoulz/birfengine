package com.burninghead.birf.view.stage2d.comps.console
{
	import flash.text.TextFieldType;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	/**
	 * @author tomas.augustinovic
	 */
	public class DefaultConsoleSkin extends Sprite
	{
		private var _textFormat:TextFormat;
		private var _inputField:TextField;
		private var _outputField:TextField;
		
		public function DefaultConsoleSkin()
		{
			addEventListener(Event.ADDED_TO_STAGE, onSkinAddedToStage);
		}

		private function onSkinAddedToStage(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, onSkinAddedToStage);
			
			_textFormat = new TextFormat();
			_textFormat.font = "Courier New";
			_textFormat.color = 0xffffff;
			_textFormat.align = TextFormatAlign.LEFT;
			_textFormat.bold = false;
			_textFormat.size = 12;
			
			_inputField = new TextField();
			_inputField.type = TextFieldType.INPUT;
			_inputField.multiline = false;
			_inputField.width = this.stage.stageWidth;
			_inputField.height = 20;
			_inputField.y = this.stage.stageHeight - 20;
			_inputField.defaultTextFormat = _textFormat;
			
			_outputField = new TextField();
			_outputField.multiline = true;
			_outputField.autoSize = TextFieldAutoSize.LEFT;
			_outputField.x = 0;
			_outputField.y = 0;
			_outputField.width = this.stage.stageWidth;
			_outputField.height = this.stage.stageHeight;
			_outputField.selectable = true;
			_outputField.defaultTextFormat = _textFormat;

			createGraphics();

			addChild(_inputField);
			addChild(_outputField);
			
			mouseEnabled = true;
			mouseChildren = true;
		}

		protected function createGraphics():void
		{
			graphics.beginFill(0, 0.7);
			graphics.drawRect(0, this.stage.stageHeight - 20, this.stage.stageWidth, 20);
			graphics.endFill();
			graphics.beginFill(0, 0.7);
			graphics.drawRect(0, 0, this.stage.stageWidth, this.stage.stageHeight);
			graphics.endFill();
		}

		public function get inputField():TextField
		{
			return _inputField;
		}

		public function get outputField():TextField
		{
			return _outputField;
		}
	}
}
