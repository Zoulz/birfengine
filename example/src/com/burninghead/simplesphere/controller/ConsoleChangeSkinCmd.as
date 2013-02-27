package com.burninghead.simplesphere.controller
{
	import com.burninghead.birf.controller.BaseCommand;
	import com.burninghead.birf.controller.ICommand;
	import com.burninghead.birf.view.IView;
	import com.burninghead.simplesphere.view.SimpleSphereViewMsgType;
	import com.burninghead.utils.ReflectionUtil;
	/**
	 * @author tomas.augustinovic
	 */
	public class ConsoleChangeSkinCmd extends BaseCommand implements ICommand
	{
		[Inject] public var view:IView;
		
		public function execute(params:*):void
		{
			var newSkin:* = ReflectionUtil.getInstanceByName(String(Object(params).params[0]));
			var applyTo:Class = ReflectionUtil.getClass(String(Object(params).params[1]));
			
			_messenger.sendMessage(SimpleSphereViewMsgType.CHANGE_SKIN, { skin: newSkin, applyTo: applyTo });
		}
	}
}
