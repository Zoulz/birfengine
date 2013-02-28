package com.burninghead.tests.unit.view
{
	import com.burninghead.birf.messaging.IMessageHandler;
	import com.burninghead.birf.model.BaseModel;
	import com.burninghead.birf.model.IModel;
	import com.burninghead.birf.view.BaseMediator;
	import com.burninghead.birf.view.BaseView;
	import com.burninghead.tests.TestRunner;
	import com.burninghead.utils.messaging.handlers.SignalMessageHandler;

	import org.flexunit.assertThat;
	import org.hamcrest.object.equalTo;
	import org.hamcrest.object.notNullValue;
	import org.osflash.signals.utils.SignalAsyncEvent;
	import org.osflash.signals.utils.handleSignal;
	/**
	 * @author tomas.augustinovic
	 */
	public class BaseViewTests
	{
		private var _view:BaseView;
		
		[Before]
		public function runBeforeEveryTest():void
		{
			var msgHandler:IMessageHandler = new SignalMessageHandler();
			var model:IModel = new BaseModel(msgHandler);
			
			_view = new BaseView(model, msgHandler);
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
			_view.initialized.addOnce(onViewInitialized);
			
			//	Set the stage container reference to allow view to initialize.
			_view.stageObject = TestRunner.stageContainer;
		}
		
		private function onViewInitialized():void
		{
			//	Assert if initialized flag has been set.
			assertThat(_view.isInitialized, equalTo(true));
			
			//	Remove stage object.
			_view.stageObject = null;
			
			//	Assert that initialized flag has been set to false.
			assertThat(_view.isInitialized, equalTo(false));
		}
		
		[Test]
		public function registerMediatorTest():void
		{
			//	Set the stage container reference to allow view to initialize.
			_view.stageObject = TestRunner.stageContainer;
			
			//	Attempt to register a mediator.
			_view.registerMediator(BaseMediator);
		}
		
		[Test]
		public function getMediatorTest():void
		{
			//	Set the stage container reference to allow view to initialize.
			_view.stageObject = TestRunner.stageContainer;
			
			//	Register a mediator.
			_view.registerMediator(BaseMediator);
			
			//	Assert that the mediator can be retrieved.
			assertThat(_view.getMediator(BaseMediator), notNullValue());
		}
		
		[Test]
		public function unregisterMediatorTest():void
		{
			//	Set the stage container reference to allow view to initialize.
			_view.stageObject = TestRunner.stageContainer;

			//	Register mediator.
			_view.registerMediator(BaseMediator);

			//	Remove mediator.
			_view.unregisterMediator(BaseMediator);
		}
	}
}
