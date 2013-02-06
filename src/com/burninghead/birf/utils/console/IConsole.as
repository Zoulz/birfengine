package com.burninghead.birf.utils.console
{
	/**
	 * @author BigZoulz
	 */
	public interface IConsole
	{
		function println(text:*, printCategory:String = "default", textColor:int = 0xffff00):void;
		function getOutput():String;
		function isActivated():Boolean;
		function activate():void;
		function deactivate():void;
		function disablePrintCategory(printCategory:String):void;
		function enablePrintCategory(printCategory:String):void;
		function isPrintCategoryEnabled(printCategory:String):Boolean;
		function registerProcessor(command:String, processor:IConsoleCommandProcessor, description:String = ""):void;
		function unregisterProcessor(command:String, processor:IConsoleCommandProcessor):void;
	}
}
