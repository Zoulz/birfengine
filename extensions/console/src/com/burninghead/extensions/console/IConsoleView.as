package com.burninghead.extensions.console
{
	import com.burninghead.birf.view.IViewComponent;
	import org.osflash.signals.ISignal;
	/**
	 * @author tomas.augustinovic
	 */
	public interface IConsoleView extends IViewComponent
	{
		function activate():void;
		function deactivate():void;
		function clearOutput():void;
		function print(message:String, color:String = "#FFFFFF"):void;
		function get inputString():String;
		function get isActive():Boolean;
		function get keyPressed():ISignal;
	}
}
