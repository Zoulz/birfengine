package com.burninghead.simplesphere.view.mediators
{
	import com.burninghead.birf.messaging.IMessage;
	import com.burninghead.birf.model.BaseModelMsgType;
	import com.burninghead.birf.model.IModel;
	import com.burninghead.birf.view.IMediator;
	import com.burninghead.extensions.view.displaylist.DisplayListMediator;
	import com.burninghead.simplesphere.controller.SphereChangeColorCmd;
	import com.burninghead.simplesphere.model.ISphereModel;
	import com.burninghead.simplesphere.view.comps.SphereView;

	import flash.events.MouseEvent;
	/**
	 * @author Zoulz
	 */
	public class SphereMediator extends DisplayListMediator implements IMediator
	{
		[Inject] public var model:IModel;
		
		private var _sphere:ISphereModel;
		private var _component:SphereView;
		
		/**
		 * Initializes the mediator by saving a reference to the
		 * model parts we need to access.
		 */
		override protected function init():void
		{
			//	Save reference to model.
			_sphere = model.getProxy(ISphereModel) as ISphereModel;
		}
		
		/**
		 * Overriden to handle any messaging that we might be interested
		 * in for this mediator.
		 */
		override protected function onMessageReceived(msg:IMessage):void
		{
			switch (msg.type)
			{
				case BaseModelMsgType.UPDATE:
				{
					//	The model has been updated so update sphere view.
					_component.setColor(_sphere.color);
					_component.setText(_sphere.numClicks.toString());
					break;
				}
			}
		}
		
		/**
		 * Overriden to attach a event listener for the view component of this
		 * mediator.
		 */
		override public function registerView(value:*):void
		{
			super.registerView(value);
			
			//	Save casted reference to the view component.
			_component = displayObject as SphereView;
			
			//	Add mouse click event listener.
			displayObject.addEventListener(MouseEvent.CLICK, onClickEvent);
		}
		
		/**
		 * Event handler for clicking the view component.
		 */
		private function onClickEvent(event:MouseEvent):void
		{
			//	If the sphere is clicked, dispatch a command to change it's color.
			_messenger.sendCommandMessage(SphereChangeColorCmd);
		}
		
		/**
		 * Clean up when the mediator is disposed. Remove listener from the
		 * view component.
		 */
		override public function dispose():void
		{
			displayObject.removeEventListener(MouseEvent.CLICK, onClickEvent);
		}
	}
}
