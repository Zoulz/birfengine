package com.burninghead.extensions.view.stage2d.comps.ui
{
	import com.burninghead.birf.utils.IDisposable;
	import com.burninghead.birf.view.skinning.ISkinnable;
	import com.burninghead.extensions.audio.groups.IUISoundGroup;

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
