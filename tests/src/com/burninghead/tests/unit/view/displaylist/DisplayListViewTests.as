package com.burninghead.tests.unit.view.displaylist
{
	import com.burninghead.extensions.view.displaylist.DisplayListView;
	import com.burninghead.birf.messaging.IMessageHandler;
	import com.burninghead.birf.model.BaseModel;
	import com.burninghead.birf.model.IModel;
	import com.burninghead.extensions.messaging.handlers.SignalMessageHandler;
	import com.burninghead.tests.TestRunner;

	import org.flexunit.assertThat;
	import org.hamcrest.object.equalTo;
	import org.osflash.signals.utils.SignalAsyncEvent;
	import org.osflash.signals.utils.handleSignal;
	/**
	 * @author tomas.augustinovic
	 */
	public class DisplayListViewTests
	{
		private var _view:DisplayListView;
		
		[Before]
		public function runBeforeEveryTest():void
		{
			var msgHandler:IMessageHandler = new SignalMessageHandler();
			var model:IModel = new BaseModel(msgHandler);
			
			_view = new DisplayListView(model, msgHandler);
		}
		
		[After]
		public function runAfterEveryTest():void
		{
			_view = null;
		}
		
		[Test(async)]
		public function isInitializedTest():void
		{
			handleSignal(this, _view.initialized, onViewInitialized);
			
			_view.stageObject = TestRunner.stageContainer;
		}
		
		private function onViewInitialized(event:SignalAsyncEvent, data:Object):void
		{
			assertThat(_view.isInitialized, equalTo(true));
		}
	}
}
