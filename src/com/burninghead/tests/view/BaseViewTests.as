package com.burninghead.tests.view
{
	import flexunit.framework.Assert;

	import com.burninghead.TestRunner;
	import com.burninghead.birf.messaging.BaseMessageHandler;
	import com.burninghead.birf.messaging.IMessageHandler;
	import com.burninghead.birf.model.BaseModel;
	import com.burninghead.birf.model.IModel;
	import com.burninghead.birf.view.BaseMediator;
	import com.burninghead.birf.view.BaseView;

	import org.flexunit.assertThat;
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
			var msgHandler:IMessageHandler = new BaseMessageHandler();
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
			handleSignal(this, _view.initialized, onViewInitialized);
			
			_view.stageObject = TestRunner.stageContainer;
		}
		
		private function onViewInitialized(event:SignalAsyncEvent, data:Object):void
		{
			Assert.assertTrue(_view.isInitialized);
		}
		
		[Test]
		public function registerMediatorTest():void
		{
			_view.stageObject = TestRunner.stageContainer;
			
			_view.registerMediator(BaseMediator);
		}
		
		[Test]
		public function getMediatorTest():void
		{
			_view.stageObject = TestRunner.stageContainer;
			
			_view.registerMediator(BaseMediator);
			
			assertThat(_view.getMediator(BaseMediator), notNullValue());
		}
		
		[Test]
		public function unregisterMediatorTest():void
		{
			_view.stageObject = TestRunner.stageContainer;
			
			_view.registerMediator(BaseMediator);
				
			_view.unregisterMediator(BaseMediator);
		}
	}
}
