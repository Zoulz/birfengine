package com.burninghead.extensions.displaylist.comps.ui
{
	import com.burninghead.birf.view.IViewComponent;
	import com.burninghead.utils.audio.groups.IUISoundGroup;

	import org.osflash.signals.ISignal;

	/**
	 * @author BigZoulz
	 */
	public interface IButtonView extends IViewComponent
	{
		function set caption(value:String):void;
		function get caption():String;
		function get click():ISignal;
		function set enabled(value:Boolean):void;
		function set soundGroup(soundGroup:IUISoundGroup):void;
		function get soundGroup():IUISoundGroup;
	}
}
