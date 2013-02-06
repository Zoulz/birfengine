package com.burninghead.template.view
{
	import com.burninghead.birf.messaging.IMessage;
	import com.burninghead.birf.model.IModel;
	import com.burninghead.birf.view.IMediator;
	import com.burninghead.birf.view.stage2d.Stage2DMediator;
	import com.burninghead.template.controller.TemplateCmd;
	import com.burninghead.template.model.ITemplateModelPart;
	import com.burninghead.template.model.ModelMessageType;
	import com.burninghead.template.view.comps.SphereView;

	import flash.events.MouseEvent;
	import flash.geom.Point;



	/**
	 * @author tomas.augustinovic
	 */
	public class SphereMediator extends Stage2DMediator implements IMediator
	{
		[Inject] public var model:IModel;
		
		private var _modelPart:ITemplateModelPart;
		
		public function SphereMediator()
		{
		}
		
		override protected function init():void
		{
			_modelPart = model.getModelPart(ITemplateModelPart) as ITemplateModelPart;
		}
		
		override protected function onMessageReceived(msg:IMessage):void
		{
			switch (msg.type)
			{
				case ModelMessageType.UPDATE:
				{
					SphereView(displayObject).setNum(_modelPart.numClicks);
					break;
				}
			}
		}
		
		public function set position(value:Point):void
		{
			displayObject.x = value.x;
			displayObject.y = value.y;
		}

		private function onClickEvent(event:MouseEvent):void
		{
			_messenger.sendCommandMessage(TemplateCmd);
		}

		override public function registerView(value:*):void
		{
			super.registerView(value);
			
			displayObject.addEventListener(MouseEvent.CLICK, onClickEvent);
		}

		override public function dispose():void
		{
			displayObject.removeEventListener(MouseEvent.CLICK, onClickEvent);
		}
	}
}
