package com.burninghead.tests.unit.view.displaylist
{
	import com.burninghead.birf.messaging.IMessageHandler;
	import com.burninghead.birf.model.BaseModel;
	import com.burninghead.birf.model.IModel;
	import com.burninghead.extensions.view.displaylist.DisplayListView;
	import com.burninghead.tests.TestRunner;
	import com.burninghead.utils.messaging.handlers.SignalMessageHandler;

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
			//	Listen for initialized signal.
			handleSignal(this, _view.initialized, onViewInitialized);
			
			//	Set the stage container reference to allow view to initialize.
			_view.stageObject = TestRunner.stageContainer;
		}
		
		private function onViewInitialized(event:SignalAsyncEvent, data:Object):void
		{
			//	Assert if initialized flag has been set.
			assertThat(_view.isInitialized, equalTo(true));
		}
	}
}
