package com.burninghead.simplesphere.view.comps
{
	import org.osflash.signals.ISignal;
	import com.burninghead.birf.view.IViewComponent;
	/**
	 * @author tomas.augustinovic
	 */
	public interface ISphereView extends IViewComponent
	{
		function setText(txt:String):void;
		function setColor(c:uint):void;
		function get click():ISignal;
	}
}
