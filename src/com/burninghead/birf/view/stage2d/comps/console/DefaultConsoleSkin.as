package com.burninghead.birf.view.stage2d.comps.console
{
	import flash.text.TextFormat;
	import mx.core.FontAsset;

	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.AntiAliasType;
	import flash.text.Font;
	import flash.text.StyleSheet;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFieldType;
	import flash.utils.describeType;
	/**
	 * @author tomas.augustinovic
	 */
	public class DefaultConsoleSkin extends Sprite
	{
		private var _ss:StyleSheet;
		private var _inputField:TextField;
		private var _outputField:TextField;
		
		[Embed(systemFont="Courier New", mimeType="application/x-font", fontName="birfConsoleFont", unicodeRange="U+0020-U+002F,U+0030-U+0039,U+003A-U+0040,U+0041-U+005A,U+005B-U+0060,U+0061-U+007A,U+007B-U+007E,U+02C6,U+02DC,U+2013-U+2014,U+2018-U+201A,U+201C-U+201E,U+2020-U+2022,U+2026,U+2030,U+2039-U+203A,U+20AC,U+2122", embedAsCFF="false")] // Uppercase [A..Z] ; Lowercase [a..z] ; Numerals [0..9] ; Punctuation [!@#%...] ; chars=""
		public  var consoleFont:Class;
		
		public function DefaultConsoleSkin()
		{
			//	Register console font.
			FontAsset;
			var xml:XML = describeType(this);
			for (var i:uint = 0; i < xml.variable.length(); i++)
			{
				Font.registerFont(this[xml.variable[i].@name]);
			}
			
			addEventListener(Event.ADDED_TO_STAGE, onSkinAddedToStage);
		}

		private function onSkinAddedToStage(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, onSkinAddedToStage);
			
			_ss = new StyleSheet();
			_ss.setStyle("font-family", "Courier New");
			_ss.setStyle("font-size", "14");
			
			var tf:TextFormat = new TextFormat();
			tf.font = "birfConsoleFont";
			tf.color = 0xffffff;
			tf.size = 14;
			
			_inputField = new TextField();
			_inputField.defaultTextFormat = tf;
			_inputField.embedFonts = true;
			_inputField.antiAliasType = AntiAliasType.ADVANCED;
			_inputField.sharpness = 100;
			_inputField.thickness = 100;
			_inputField.type = TextFieldType.INPUT;
			_inputField.autoSize = TextFieldAutoSize.NONE;
			_inputField.multiline = false;
			_inputField.width = this.stage.stageWidth;
			_inputField.height = 20;
			_inputField.y = this.stage.stageHeight - 20;
			
			_outputField = new TextField();
			_outputField.styleSheet = _ss;
			_outputField.embedFonts = true;
			_outputField.multiline = true;
			_outputField.autoSize = TextFieldAutoSize.NONE;
			_outputField.x = 0;
			_outputField.y = 0;
			_outputField.antiAliasType = AntiAliasType.ADVANCED;
			_outputField.sharpness = 100;
			_outputField.thickness = 100;
			_outputField.width = this.stage.stageWidth;
			_outputField.height = this.stage.stageHeight - 20;
			_outputField.selectable = true;
			_outputField.mouseWheelEnabled = true;

			createGraphics();

			addChild(_outputField);
			addChild(_inputField);
			
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
