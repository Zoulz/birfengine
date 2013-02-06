package com.burninghead.birf.view.stage2d.comps.console
{
	import flash.display.Stage;
	import com.burninghead.birf.utils.IDisposable;
	import com.burninghead.birf.view.skinning.ISkinnable;

	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	/**
	 * @author Zoulz
	 */
	public class Stage2DConsole implements ISkinnable, IDisposable, IConsole
	{
		private var _skin:ConsoleSkin;
		private var _stage:Stage;
		private var _commandHistory:Vector.<String>;
		private var _commandHistoryIndex:Number;
		private var _commandList:Array;
		
		public function Stage2DConsole(skin:ConsoleSkin, stage:Stage)
		{
			_stage = stage;
			this.skin = skin;
			
			_commandHistory = new Vector.<String>();
			_commandHistoryIndex = -1;
			_commandList = [ ];
		}
		
		public function get skin():*
		{
			return _skin;
		}

		public function dispose():void
		{
		}

		public function set skin(value:*):void
		{
			if (_skin != null)
			{
				_skin.stage.removeEventListener(KeyboardEvent.KEY_DOWN, onKeyboardDown);
				_skin.stage.removeEventListener(MouseEvent.MOUSE_WHEEL, onMouseScroll);
				_skin.stage.removeEventListener(Event.PASTE, onPaste);
			}
			
			_skin = value;
			
			_skin.stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyboardDown);
			_skin.stage.addEventListener(MouseEvent.MOUSE_WHEEL, onMouseScroll);
			_skin.stage.addEventListener(Event.PASTE, onPaste);
			
			_skin.print("> Debug Console. Type help for info.");
		}

		private function onPaste(event:Event):void
		{
			
		}

		private function onMouseScroll(event:MouseEvent):void
		{
			
		}

		private function onKeyboardDown(event:KeyboardEvent):void
		{
			
		}

		public function activate():void
		{
		}

		public function deactivate():void
		{
		}
	}
}
