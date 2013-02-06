package com.burninghead.birf.view.stage2d.comps.console
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	/**
	 * @author Zoulz
	 */
	public class ConsoleSkin extends Sprite
	{
		private var _inputField:TextField;
		private var _autoCompletionField:TextField;
		private var _output:TextField;
		private var _charMarker:Sprite;
		private var _stageWidth:uint;
		private var _stageHeight:uint;
		
		protected var _textFormat:TextFormat;
		protected var _textFormatOutput:TextFormat;
		protected var _textFormatAutoComplete:TextFormat;
		
		public function ConsoleSkin(stageWidth:uint, stageHeight:uint)
		{
			_stageWidth = stageWidth;
			_stageHeight = stageHeight;
			
			_textFormat = new TextFormat();
			_textFormat.font = "Courier New";
			_textFormat.color = 0xffff00;
			_textFormat.align = TextFormatAlign.LEFT;
			_textFormat.bold = false;
			_textFormat.size = 11;

			_textFormatOutput = new TextFormat();
			_textFormatOutput.font = "Courier New";
			_textFormatOutput.color = 0xffff00;
			_textFormatOutput.align = TextFormatAlign.LEFT;
			_textFormatOutput.bold = false;
			_textFormatOutput.size = 11;

			_textFormatAutoComplete = new TextFormat();
			_textFormatAutoComplete.font = "Courier New";
			_textFormatAutoComplete.color = 0x000000;
			_textFormatAutoComplete.align = TextFormatAlign.LEFT;
			_textFormatAutoComplete.bold = false;
			_textFormatAutoComplete.size = 11;
			
			_inputField = new TextField();
			_inputField.multiline = false;
			_inputField.width = _stageWidth;
			_inputField.height = 20;
			_inputField.y = _stageHeight - 20;
			_inputField.textColor = 0xffffff;
			_inputField.text = "> ";
			_inputField.selectable = false;
			
			_autoCompletionField = new TextField();
			_autoCompletionField.multiline = false;
			_autoCompletionField.width = _stageWidth;
			_autoCompletionField.height = 20;
			_autoCompletionField.y = _stageHeight - 20;
			_autoCompletionField.textColor = 0x000000;
			_autoCompletionField.background = true;
			_autoCompletionField.backgroundColor = 0xffff00;
			_autoCompletionField.autoSize = TextFieldAutoSize.LEFT;
			_autoCompletionField.selectable = false;
			_autoCompletionField.visible = false;
			
			_output = new TextField();
			_output.multiline = true;
			_output.autoSize = TextFieldAutoSize.LEFT;
			_output.x = 0;
			_output.y = 0;
			_output.textColor = 0xffffff;
			_output.selectable = true;
			
			_charMarker = new Sprite();
			updateCharMarker();
			
			var outputMask:Sprite = new Sprite();
			outputMask.graphics.beginFill(0xffffff);
			outputMask.graphics.drawRect(0, 0, _stageWidth, _stageHeight - 20);
			outputMask.graphics.endFill();
			_output.mask = outputMask;
			
			this.graphics.beginFill(0, 0.7);
			this.graphics.drawRect(0, _stageHeight - 20, _stageWidth, 20);
			this.graphics.endFill();
			this.graphics.beginFill(0, 0.7);
			this.graphics.drawRect(0, 0, _stageWidth, _stageHeight);
			this.graphics.endFill();

			this.addChild(_inputField);
			this.addChild(_autoCompletionField);
			this.addChild(_output);
			this.addChild(outputMask);
			this.addChild(_charMarker);

			this.mouseEnabled = true;
			this.mouseChildren = true;
		}
		
		public function print(text:*, printCategory:String = "default", textColor:int = 0xffff00):void
		{
			//if (!isPrintCategoryEnabled(printCategory))
			//{
			//	return;
			//}

			var str:String = String(text);

			_output.appendText(str);
			_output.appendText("\n");
			_output.y = _stageHeight - 25 - _output.textHeight;

			_textFormatOutput.color = textColor;
			_output.setTextFormat(_textFormatOutput, _output.length - (str.length + 1), _output.length);
		}
		
		private function updateCharMarker():void
		{
			if (_autoCompletionField.visible)
			{
				_charMarker.graphics.beginFill(0);
			}
			else
			{
				_charMarker.graphics.beginFill(0xffff00);
			}

			_charMarker.graphics.drawRect(0, 0, 7, 1);
			_charMarker.graphics.endFill();
			_charMarker.x = _inputField.textWidth + (_autoCompletionField.visible ? 5 : 3);
			_charMarker.y = _stageHeight - 4;
		}
	}
}
