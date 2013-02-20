package com.burninghead.tests.unit.states
{
	import org.hamcrest.object.equalTo;
	import mockolate.nice;
	import mockolate.partial;
	import mockolate.prepare;
	import mockolate.runner.MockolateRule;

	import com.burninghead.birf.states.BaseState;
	import com.burninghead.birf.states.BaseStateMachine;
	import com.burninghead.birf.states.BaseStateTransition;

	import org.flexunit.assertThat;
	import org.flexunit.async.Async;
	import org.hamcrest.object.notNullValue;
	import org.osflash.signals.utils.SignalAsyncEvent;
	import org.osflash.signals.utils.handleSignal;

	import flash.events.Event;

	/**
	 * @author tomas.augustinovic
	 */
	public class BaseStateMachineTests
	{
		[Rule] public var mockolateRule:MockolateRule = new MockolateRule();
		[Mock(type="partial")] public var mockState:MockBaseState;
		[Mock(type="partial")] public var mockStateTwo:BaseState;
		
		private var _sm:BaseStateMachine;
		
		[Before(async)]
		public function runBeforeEachTest():void
		{
			_sm = new BaseStateMachine();
			
			Async.proceedOnEvent(this, prepare(MockBaseState, BaseState, BaseStateTransition), Event.COMPLETE);
		}
		
		[After]
		public function runAfterEveryTest():void
		{
			_sm = null;
		}
		
		[Test]
		public function registerStateTest():void
		{
			assertThat(mockState, notNullValue());

			_sm.registerState("firstState", mockState);
		}
		
		[Test]
		public function unregisterStateTest():void
		{
			assertThat(mockState, notNullValue());

			_sm.registerState("firstState", mockState);
			
			_sm.unregisterState("firstState");
		}
		
		[Test]
		public function registerStateTransitionTest():void
		{
			var mockTransition:BaseStateTransition = nice(BaseStateTransition);
			
			assertThat(mockTransition, notNullValue());

			_sm.registerTransition("test", mockTransition);
		}
		
		[Test]
		public function updateStatesTest():void
		{
			assertThat(mockState, notNullValue());

			_sm.registerState("firstState", mockState);
			
			_sm.update();
		}
		
		[Test(async)]
		public function changeStateTest():void
		{
			var mockTransition:BaseStateTransition = nice(BaseStateTransition, null, [ "firstState", "nextState"] );
			
			assertThat(mockState, notNullValue());
			assertThat(mockTransition, notNullValue());
			
			_sm.registerState("firstState", mockState);
			_sm.registerTransition("testTransition", mockTransition);
			
			handleSignal(this, _sm.stateChanged, changeStateTest_stateChanged);
			
			_sm.changeState("firstState");
		}
		
		private function changeStateTest_stateChanged(event:SignalAsyncEvent, data:Object):void
		{
			assertThat(_sm.stateId, equalTo("firstState"));
		}
		
		[Test(async)]
		public function stateTransitionTest():void
		{
			var mockTransition:BaseStateTransition = partial(BaseStateTransition, null, [ "firstState", "nextState"] );
			
			assertThat(mockState, notNullValue());
			assertThat(mockStateTwo, notNullValue());
			assertThat(mockTransition, notNullValue());

			_sm.registerState("firstState", mockState);
			_sm.registerState("nextState", mockStateTwo);
			_sm.registerTransition("testTransition", mockTransition);
			
			handleSignal(this, _sm.stateChanged, stateTransitionTest_stateChanged);
			
			_sm.changeState("firstState");
		}
		
		private function stateTransitionTest_stateChanged(event:SignalAsyncEvent, data:Object):void
		{
			assertThat(_sm.stateId, equalTo("firstState"));
			
			handleSignal(this, _sm.stateChanged, onStateChangedToNext);
		}
		
		private function onStateChangedToNext(event:SignalAsyncEvent, data:Object):void
		{
			assertThat(_sm.stateId, equalTo("nextState"));
		}
	}
}
