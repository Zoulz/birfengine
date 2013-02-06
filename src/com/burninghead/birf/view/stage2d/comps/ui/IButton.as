package com.burninghead.birf.view.stage2d.comps.ui
{
	import com.burninghead.birf.audio.groups.IUISoundGroup;
	import com.burninghead.birf.utils.IDisposable;
	import com.burninghead.birf.view.skinning.ISkinnable;

	import org.osflash.signals.ISignal;

	/**
	 * @author BigZoulz
	 */
	public interface IButton extends ISkinnable, IDisposable
	{
		function set caption(value:String):void;
		function get caption():String;
		function get click():ISignal;
		function set enabled(value:Boolean):void;
		function set soundGroup(soundGroup:IUISoundGroup):void;
		function get soundGroup():IUISoundGroup;
	}
}
