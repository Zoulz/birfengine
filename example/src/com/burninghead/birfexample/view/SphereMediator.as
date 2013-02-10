package com.burninghead.birfexample.view
{
	import com.burninghead.birfexample.controller.SphereChangeColorCmd;
	import com.burninghead.birf.messaging.IMessage;
	import com.burninghead.birf.model.BaseModelMessageType;
	import com.burninghead.birf.model.IModel;
	import com.burninghead.birf.view.IMediator;
	import com.burninghead.birf.view.stage2d.Stage2DMediator;
	import com.burninghead.birfexample.model.ISphereModel;

	import flash.events.MouseEvent;
	/**
	 * @author Zoulz
	 */
	public class SphereMediator extends Stage2DMediator implements IMediator
	{
		[Inject] public var model:IModel;
		
		private var _sphere:ISphereModel;
		
		public function SphereMediator()
		{
		}
		
		override protected function init():void
		{
			_sphere = model.getModelPart(ISphereModel) as ISphereModel;
		}
		
		override protected function onMessageReceived(msg:IMessage):void
		{
			switch (msg.type)
			{
				case BaseModelMessageType.UPDATE:
				{
					SphereView(displayObject).setColor(_sphere.color);
					break;
				}
			}
		}
		
		override public function registerView(value:*):void
		{
			super.registerView(value);
			
			displayObject.addEventListener(MouseEvent.CLICK, onClickEvent);
		}
		
		private function onClickEvent(event:MouseEvent):void
		{
			_messenger.sendCommandMessage(SphereChangeColorCmd);
		}
		
		override public function dispose():void
		{
			displayObject.removeEventListener(MouseEvent.CLICK, onClickEvent);
		}
	}
}
