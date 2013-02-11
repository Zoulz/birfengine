package com.burninghead.birf.view.stage2d.mediators
{
	import com.burninghead.birf.messaging.IMessage;
	import com.burninghead.birf.view.IMediator;
	import com.burninghead.birf.view.stage2d.Stage2DMediator;
	import com.burninghead.birf.view.stage2d.comps.console.Stage2DConsoleView;

	import flash.events.KeyboardEvent;
	import flash.utils.Dictionary;
	/**
	 * @author BigZoulz
	 */
	public class ConsoleMediator extends Stage2DMediator implements IMediator
	{
		private var _console:Stage2DConsoleView;
		private var _mapping:Dictionary;
		
		override protected function init():void
		{
			_mapping = new Dictionary();
		}
		
		override protected function onMessageReceived(msg:IMessage):void
		{
			var pl:Object = msg.payload;
			
			switch (msg.type)
			{
				case ConsoleMediatorMsgType.MAP_COMMAND:
				{
					_mapping[pl.id] = pl.classDef;
					break;
				}
				
				case ConsoleMediatorMsgType.PRINT_MESSAGE:
				{
					_console.print(pl.msg, String(pl.category));
					break;
				}
				
				case ConsoleMediatorMsgType.OPEN:
				{
					_console.activate();
					break;
				}
				
				case ConsoleMediatorMsgType.CLOSE:
				{
					_console.deactivate();
					break;
				}
				
				case ConsoleMediatorMsgType.SET_CATEGORY_FILTER:
				{
					_console.categoryFilter = pl.filters;
					break;
				}
			}
		}
		
		override public function registerView(value:*):void
		{
			super.registerView(value);
			
			_console = Stage2DConsoleView(displayObject);
			
			_console.stage.addEventListener(KeyboardEvent.KEY_UP, onKeyPressed);
		}

		private function onKeyPressed(event:KeyboardEvent):void
		{
			switch (event.keyCode)
			{
				//	RETURN
				case 13:
				{
					//	Split console input into array.
					var splt:Array = _console.getInputString().split(" ");
					var payload:Object = { params: splt.slice(1) };
					
					//	Execute the command associated with the input msg string.
					_messenger.sendCommandMessage(_mapping[splt[0]], payload);
					break;
				}
				
				//	ESCAPE
				case 27:
				{
					if (_console.isActive)
					{
						_console.deactivate();
					}
					else
					{
						_console.activate();
					}
					break;
				}
			}
		}
		
		override public function dispose():void
		{
			super.dispose();
			
			_console.stage.removeEventListener(KeyboardEvent.KEY_UP, onKeyPressed);
		}
	}
}
