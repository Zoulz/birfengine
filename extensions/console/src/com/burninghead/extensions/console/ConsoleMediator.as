package com.burninghead.extensions.console
{
	import com.burninghead.birf.messaging.IMessage;
	import com.burninghead.birf.view.BaseMediator;
	import com.burninghead.birf.view.IMediator;

	import flash.events.KeyboardEvent;
	import flash.utils.Dictionary;
	/**
	 * @author tomas.augustinovic
	 */
	public class ConsoleMediator extends BaseMediator implements IMediator
	{
		private var _console:IConsoleView;
		private var _category:Dictionary;
		private var _filters:Vector.<String>;
		private var _mapping:Dictionary;
		
		override protected function init():void
		{
			_mapping = new Dictionary();
			
			_filters = new Vector.<String>();
			_filters.push("INFO");
			_filters.push("WARN");
			_filters.push("ERROR");
			_filters.push("COMMAND");

			_category = new Dictionary();
			_category["INFO"] = "#F5FAF2";
			_category["WARN"] = "#F7D85C";
			_category["ERROR"] = "#FF0000";
			_category["COMMAND"] = "#A3FFAF";
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
					var category:String = pl.category;
					
					if (_filters.indexOf(category) >= 0)
					{
						_console.print(pl.msg, getColorByCategory(category));
					}
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
					_filters = pl.filters;
					break;
				}
			}
		}
		
		override public function registerView(value:*):void
		{
			super.registerView(value);
			
			_console = _view as IConsoleView;
			
			_console.keyPressed.add(onKeyPressed);
		}
		
		private function getColorByCategory(category:String):String
		{
			var cl:String = _category[category];
			
			if (cl == null || cl == "")
			{
				return "#FFFFFF";
			}
			
			return cl;
		}

		private function onKeyPressed(event:KeyboardEvent):void
		{
			switch (event.keyCode)
			{
				//	RETURN
				case 13:
				{
					//	Split console input into array.
					var splt:Array = _console.inputString.split(" ");
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
			
			_console.keyPressed.remove(onKeyPressed);
		}
	}
}
