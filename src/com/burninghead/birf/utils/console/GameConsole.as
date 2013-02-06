package com.burninghead.birf.utils.console
{
	import flash.desktop.Clipboard;
	import flash.desktop.ClipboardFormats;
	import flash.desktop.ClipboardTransferMode;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;

	/**
	 * Console class.
	 * Used for collecting input and sending commands to its registered processors.
	 */
	public class GameConsole extends Sprite implements IConsoleCommandProcessor, IConsole
	{
		private static const VERSION:String = "2.0";
		private var _inputField:TextField;
		private var _activated:Boolean;
		private var _stage:Stage;
		private var _processors:Object;
		private var _commandList:Array;
		private var _isDebugMode:Boolean;
		private var _commandHistory:Vector.<String>;
		private var _commandHistoryIndex:Number;
		private var _autoCompletionField:TextField;
		private var _output:TextField;
		private var _gameHeight:Number;
		protected var _textFormat:TextFormat;
		protected var _textFormatOutput:TextFormat;
		protected var _textFormatAutoComplete:TextFormat;
		protected var _activationCallback:Function;
		private var _printCategoriesDisabledList:Array;
		private var _charMarker:Sprite;

		/**
		 * Constructor.
		 * @param	stage		The main stage.
		 * @param	gameWidth	Width of game area.
		 * @param	gameHeight	Height of game area.
		 * @param	isDebugMode	True if game is running in debug mode. (The console will only be active if debug mode is set.)
		 * @param	activationCallback	Optional callback that will be called when activating and deactivating the console. Callback definition: function( activated:boolean ):void
		 */
		public function GameConsole(stage:Stage, gameWidth:int, gameHeight:int, isDebugMode:Boolean = false, activationCallback:Function = null)
		{
			_stage = stage;
			_isDebugMode = isDebugMode;
			_gameHeight = gameHeight;

			_activationCallback = activationCallback;

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

			// Create input text field
			_inputField = new TextField();
			_inputField.multiline = false;
			_inputField.width = gameWidth;
			_inputField.height = 20;
			_inputField.y = gameHeight - 20;
			_inputField.textColor = 0xffffff;
			_inputField.text = "> ";
			_inputField.selectable = false;

			// Create auto completion text field
			_autoCompletionField = new TextField();
			_autoCompletionField.multiline = false;
			_autoCompletionField.width = gameWidth;
			_autoCompletionField.height = 20;
			_autoCompletionField.y = gameHeight - 20;
			_autoCompletionField.textColor = 0x000000;
			_autoCompletionField.background = true;
			_autoCompletionField.backgroundColor = 0xffff00;
			_autoCompletionField.autoSize = TextFieldAutoSize.LEFT;
			_autoCompletionField.selectable = false;
			_autoCompletionField.visible = false;

			_charMarker = new Sprite();
			updateCharMarker();

			// Create history text field
			_output = new TextField();
			_output.multiline = true;
			_output.autoSize = TextFieldAutoSize.LEFT;
			_output.x = 0;
			_output.y = 0;
			_output.textColor = 0xffffff;
			_output.selectable = true;

			// Create the output mask
			var outputMask:Sprite = new Sprite();
			outputMask.graphics.beginFill(0xffffff);
			outputMask.graphics.drawRect(0, 0, gameWidth, gameHeight - 20);
			outputMask.graphics.endFill();
			_output.mask = outputMask;

			// Draw background
			this.graphics.beginFill(0, 0.7);
			this.graphics.drawRect(0, gameHeight - 20, gameWidth, 20);
			this.graphics.endFill();
			this.graphics.beginFill(0, 0.7);
			this.graphics.drawRect(0, 0, gameWidth, gameHeight);
			this.graphics.endFill();

			this.addChild(_inputField);
			this.addChild(_autoCompletionField);
			this.addChild(_output);
			this.addChild(outputMask);
			this.addChild(_charMarker);

			this.mouseEnabled = true;
			this.mouseChildren = true;

			_commandHistory = new Vector.<String>();
			_commandHistoryIndex = -1;

			_commandList = new Array();

			// Setup print categories
			_printCategoriesDisabledList = new Array();

			disablePrintCategory("keyboard");

			println("> Console v " + VERSION + ". Type help for info.");

			_processors = new Object();
			this.registerProcessor("help", this, "Console help info.");
			this.registerProcessor("clear", this, "Clear console output.");
			this.registerProcessor("pcat", this, "Print category [info/enable/disable] [category].");
			this.registerProcessor("color", this, "Generate a random color.");
			this.registerProcessor("copy2clipboard", this, "Copy console output to clipboard.");

			_stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyboardDown);
			_stage.addEventListener(MouseEvent.MOUSE_WHEEL, onMouseScroll);
			_stage.addEventListener(Event.PASTE, onPaste);
		}

		/**
		 * Binds a command with a processor and a description.
		 * @param	command			The command.
		 * @param	processor		The processing class.
		 * @param	description		Description of the command. Displayed when typing help.
		 */
		public function registerProcessor(command:String, processor:IConsoleCommandProcessor, description:String = ""):void
		{
			if ( !_processors[ command ] )
			{
				_processors[ command ] = {"description":description, "processors":new Vector.<IConsoleCommandProcessor>()};
				_commandList.push(command);
			}
			_processors[ command ].processors.push(processor);

			if ( description.length > 0 )
				_processors[ command ].description = description;
		}

		/**
		 * Unbinds a processor from a specific command.
		 * @param	command		The command.
		 * @param	processor	The processing class.
		 */
		public function unregisterProcessor(command:String, processor:IConsoleCommandProcessor):void
		{
			if ( _processors[ command ] == null ) return;
			for ( var i:int = 0; i < _processors[ command ].processors.length; i++ )
			{
				if ( _processors[ command ].processors[ i ] == processor )
				{
					_processors[ command ].processors.splice(i, 1);
					if ( _processors[ command ].processors.length == 0 )
					{
						for ( var j:int = 0; j < _commandList.length; j++ )
						{
							if ( _commandList[ j ] == command )
							{
								_commandList.splice(j, 1);
								break;
							}
						}
						_processors[ command ] = null;
						delete _processors[ command ];
					}
					return;
				}
			}
		}

		public function onPaste(e:Event):void
		{
			_inputField.appendText(String(Clipboard.generalClipboard.getData(ClipboardFormats.TEXT_FORMAT, ClipboardTransferMode.CLONE_ONLY)));
			updateAutoCompletion();
			_inputField.setTextFormat(_textFormat);
			updateCharMarker();
		}

		/**
		 * Collects input from flash.
		 * @param	e	Flash KeyboardEvent.
		 */
		public function onKeyboardDown(e:KeyboardEvent):void
		{
			var command:String;
			var params:Array;

			println("Keyboard event " + e.keyCode, "keyboard", 7904995);

			if (e.keyCode == 27) // Esc
			{
				if (_activated)
				{
					deactivate();
				}
				else
				{
					activate();
				}
			}
			else if (_activated)
			{
				if (e.keyCode == 13) // Return
				{
					// Trim trailing white spaces.
					_inputField.text = _inputField.text.replace(/^(.*?)([ ])*$/gs, "$1");

					command = currentCommand();
					params = currentParams();

					if (command.length > 0)
					{
						_processCommand(command, params);

						if (params.length > 0)
						{
							_commandHistory.push(findAutoCompletion(command) + " " + params.join(" "));
						}
						else
						{
							_commandHistory.push(findAutoCompletion(command));
						}

						_commandHistoryIndex = _commandHistory.length;
					}
					else
					{
						println(">");
					}

					_inputField.text = "> ";
				}
				else if (e.keyCode == 8) // Backspace
				{
					if (_inputField.text.length > 2)
					{
						_inputField.text = _inputField.text.substr(0, _inputField.text.length - 1);
					}
				}
				else if (e.keyCode == 32) // Space
				{
					// Auto complete first word
					var cmd:String = currentCommand();
					var pms:Array = currentParams();

					var cmdAuto:String = findAutoCompletion(cmd);
					var extraSpace:String = "";
					if (cmdAuto && pms.length > 0)
					{
						extraSpace = " ";
					}

					_inputField.text = "> " + cmdAuto + " " + pms.join(" ") + extraSpace;
				}
				else if (e.keyCode == 40) // Down arrow
				{
					// Scroll forward through the command history.
					if (_commandHistory.length > 0 && _commandHistoryIndex < _commandHistory.length)
					{
						_commandHistoryIndex++;
						if (_commandHistoryIndex > _commandHistory.length - 1)
						{
							_inputField.text = "> ";
						}
						else
						{
							_inputField.text = "> " + _commandHistory[_commandHistoryIndex];
						}
					}
				}
				else if (e.keyCode == 38) // Up arrow
				{
					// Scroll backwards through the command history.
					if (_commandHistory.length > 0)
					{
						_commandHistoryIndex--;
						if (_commandHistoryIndex < 0)
						{
							_commandHistoryIndex = 0;
						}
						_inputField.text = "> " + _commandHistory[_commandHistoryIndex];
					}
				}
				else if (e.keyCode == 76 && e.ctrlKey) // l (lowercase L), Control + l => clear =)
				{
					triggerCommand("clear");
				}
				else if (e.keyCode == 33) // page up
				{
					onMouseScroll(new MouseEvent(MouseEvent.MOUSE_WHEEL, true, false, 0, 0, null, false, false, false, false, 5));
				}
				else if (e.keyCode == 34) // page down
				{
					onMouseScroll(new MouseEvent(MouseEvent.MOUSE_WHEEL, true, false, 0, 0, null, false, false, false, false, -5));
				}
				else
				{
					_inputField.appendText(String.fromCharCode(e.charCode));
				}

				updateAutoCompletion();
			}

			_inputField.setTextFormat(_textFormat);
			updateCharMarker();
		}

		public function onMouseScroll(e:MouseEvent):void
		{
			if (!isActivated())
			{
				return;
			}

			if (_output.textHeight < _gameHeight - 25)
			{
				return;
			}
			
			_output.y = Math.min(0, Math.max(_gameHeight - 25 - _output.textHeight, _output.y + e.delta * 10));
		}

		public function processCommand(command:String, params:Array):void
		{
			switch(command)
			{
				case "help":
				{
					printHelp();
					break;
				}
				case "clear":
				{
					_output.text = "";
					println("> Console v " + VERSION + ". Type help for info.");
					break;
				}
				case "pcat":
				{
					if (params.length > 0)
					{
						var action:String = params[0];

						var category:String = "";
						if (params.length > 1)
						{
							category = params[1];
						}

						if (action == "info")
						{
							var disabledList:String = "";
							for each ( var disabledCategory:String in _printCategoriesDisabledList )
							{
								if (disabledCategory != null)
								{
									disabledList += disabledCategory + ",";

									if (disabledList != "")
									{
										disabledList = disabledList.substring(0, disabledList.length - 1);
									}
								}
							}

							println("Disabled categories: " + disabledList);
						}
						else if ( action == "enable" && category != "" )
						{
							enablePrintCategory(category);
							println("Print category " + category + " enabled.");
						}
						else if ( action == "disable" && category != "" )
						{
							disablePrintCategory(category);
							println("Print category " + category + " disabled.");
						}
						else
						{
							println("Usage: pcat [info/enable/disable] [category]");
						}
					}
					else
					{
						println("Usage: pcat [info/enable/disable] [category]");
					}
					break;
				}
				
				case "color":
				{
					var c:int = Math.random() * 0xffffff;
					println(c + ": Lorem ipsum dolor sit amet, consectetur adipisicing elit, (...)", "default", c);
					break;
				}
				
				case "copy2clipboard":
				{
					Clipboard.generalClipboard.setData(ClipboardFormats.TEXT_FORMAT, getOutput());
					println("Output copied to clipboard.");
					break;
				}
			}
		}

		/**
		 * Manually trigger a command.
		 * @param	command		The command.
		 * @param	params		Optional parameters.
		 */
		public function triggerCommand(command:String, params:Array = null):void
		{
			_processCommand(command, params ? params : []);
		}

		public function currentCommand():String
		{
			var command:String = _inputField.text;
			var params:Array = command.split(" ");
			params.shift();
			command = params.shift();
			return command != null ? command : "";
		}

		public function currentParams():Array
		{
			var command:String = _inputField.text;
			var params:Array = command.split(" ");
			params.shift();
			command = params.shift();
			return params;
		}

		public function println(text:*, printCategory:String = "default", textColor:int = 0xffff00):void
		{
			if (!isPrintCategoryEnabled(printCategory))
			{
				return;
			}

			var str:String = String(text);
			trace(str);

			_output.appendText(str);
			_output.appendText("\n");
			_output.y = _gameHeight - 25 - _output.textHeight;

			_textFormatOutput.color = textColor;
			_output.setTextFormat(_textFormatOutput, _output.length - (str.length + 1), _output.length);
		}

		public function error(text:String):void
		{
			println("> Error: " + text, "error", 0xffffff);
		}

		public function isPrintCategoryEnabled(printCategory:String):Boolean
		{
			return _printCategoriesDisabledList[printCategory] == null;
		}

		public function enablePrintCategory(printCategory:String):void
		{
			delete _printCategoriesDisabledList[printCategory];
		}

		public function disablePrintCategory(printCategory:String):void
		{
			_printCategoriesDisabledList[printCategory] = printCategory;
		}

		public function getOutput():String
		{
			return _output.text.split("\r").join("\n");
		}

		private function updateAutoCompletion():void
		{
			// Check autocompletion
			var command:String = currentCommand();
			_autoCompletionField.x = _inputField.x + _inputField.textWidth + 3;

			if (command.length > 0)
			{
				var autoCompletion:String = findAutoCompletion(command);
				if (autoCompletion.length > 0 && autoCompletion != command && currentParams().length == 0)
				{
					_autoCompletionField.text = autoCompletion.substr(command.length);
					_autoCompletionField.visible = true;
				}
				else
				{
					_autoCompletionField.visible = false;
				}
			}
			else
			{
				_autoCompletionField.visible = false;
			}

			_autoCompletionField.setTextFormat(_textFormatAutoComplete);
		}

		public function findAutoCompletion(command:String):String
		{
			if (command.length > 0)
			{
				_autoCompletionField.x = _inputField.x + _inputField.textWidth + 3;
				
				for (var key:String in _processors)
				{
					if (key.indexOf(command) == 0)
					{
						return key;
					}
				}
			}
			return command;
		}

		/**
		 * Activates the registered processors for the incoming command.
		 * @param	command		Command.
		 * @param	params		Parameters.
		 */
		private function _processCommand(command:String, params:Array):void
		{
			// trace( "command:", command, "params:", params.join( " " ) );

			if (!_processors[command])
			{
				command = findAutoCompletion(command);
			}

			if (_processors[command] == null)
			{
				println("> \"" + command + '"\t' + "command is not registered. Type help for more info.");
			}
			else
			{
				println("> " + command + " " + params.join(" "));
				for each (var processor:IConsoleCommandProcessor in _processors[command].processors)
				{
					processor.processCommand(command, params);
				}
			}
		}

		/**
		 * Activates and displays the console.
		 */
		public function activate():void
		{
			if (_activated || !_isDebugMode)
			{
				return;
			}

			_stage.addChild(this);
			_activated = true;
			
			if (_activationCallback != null)
			{
				_activationCallback(true);
			}
		}

		public function isActivated():Boolean
		{
			return _activated;
		}

		/**
		 * Deactivates and hides the console.
		 */
		public function deactivate():void
		{
			if (!_activated)
			{
				return;
			}

			_stage.removeChild(this);
			_activated = false;

			if (_activationCallback != null)
			{
				_activationCallback(false);
			}
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
			_charMarker.y = _gameHeight - 4;
		}

		/**
		 * Print all registered commands along with their descriptions.
		 */
		private function printHelp():void
		{
			var commandTable:PT = new PT(["command", "description"]);
			for each (var command:String in _commandList)
			{
				commandTable.addRow([command, _processors[command].description]);
			}

			println(commandTable.toString());
		}
	}
}
import com.burninghead.birf.utils.StringUtil;
class PT
{
	private var _tableName:String;
	private var _headers:Array;
	private var _data:Array;

	/**
	 * Constructor
	 * @param	headers		The headers. (column names)
	 */
	public function PT(headers:Array, tableName:String = "")
	{
		_headers = headers;
		_tableName = tableName.length > 0 ? "--- " + tableName + " ---" : "";
		_data = new Array();
	}

	/**
	 * Adds a row to the table.
	 * @param	rowData		A row of data.
	 */
	public function addRow(rowData:Array):void
	{
		_data.push(rowData);
	}

	/**
	 * @return A string that is formatted like a database table.
	 */
	public function toString():String
	{
		var str:String = "";
		var i:int;
		var columnWidths:Array = new Array();
		var totalWidth:int = 0;

		for (i = 0; i < _headers.length; i++)
		{
			var width:int = longestDataLengthByColumn(i) + 4;
			columnWidths.push(width);
			totalWidth += width;
		}

		if (_tableName.length > 0)
		{
			totalWidth = Math.max(_tableName.length, totalWidth);
		}

		if (_tableName.length > 0)
		{
			str += StringUtil.padString("", totalWidth * 0.5 - _tableName.length * 0.5, "-");
			str += _tableName;
			str += StringUtil.padString("", totalWidth * 0.5 - _tableName.length * 0.5, "-") + "\n";
		}
		else
		{
			str += StringUtil.padString("-", totalWidth, "-") + "\n";
		}

		for (i = 0; i < _headers.length; i++)
		{
			str += StringUtil.padString(_headers[ i ], columnWidths[ i ]);
		}

		str += "\n";
		str += StringUtil.padString("-", totalWidth, "-") + "\n";

		for each (var row:Array in _data)
		{
			for (i = 0; i < row.length; i++)
			{
				str += StringUtil.padString(row[ i ], columnWidths[ i ]);
			}

			str += "\n";
		}

		str += StringUtil.padString("-", totalWidth, "-") + "\n";

		return str;
	}

	private function longestDataLengthByColumn(col:int):int
	{
		var len:int = String(_headers[col]).length;

		for each (var row:Array in _data)
		{
			if (String(row[col]).length > len)
			{
				len = String(row[col]).length;
			}
		}

		return len;
	}
}
