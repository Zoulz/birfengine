package com.burninghead.tests.unit.states
{
	import com.burninghead.birf.states.BaseState;
	import com.burninghead.birf.states.BaseStateMachine;
	import com.burninghead.birf.states.BaseStateTransition;
	import com.burninghead.tests.unit.mocks.MockBaseState;

	import org.flexunit.assertThat;
	import org.hamcrest.object.equalTo;
	import org.osflash.signals.utils.SignalAsyncEvent;
	import org.osflash.signals.utils.handleSignal;

	/**
	 * @author tomas.augustinovic
	 */
	public class BaseStateMachineTests
	{
		private var _sm:BaseStateMachine;
		private var _state:BaseState;
		private var _mockState:MockBaseState;
		private var _transition:BaseStateTransition;
		
		[Before]
		public function runBeforeEachTest():void
		{
			_sm = new BaseStateMachine();
			_state = new BaseState();
			_mockState = new MockBaseState();
			_transition = new BaseStateTransition("firstState", "secondState");
		}
		
		[After]
		public function runAfterEveryTest():void
		{
			_sm = null;
			_state = null;
			_mockState = null;
			_transition = null;
		}
		
		[Test]
		public function registerStateTest():void
		{
			_sm.registerState("firstState", _state);
		}
		
		[Test]
		public function unregisterStateTest():void
		{
			_sm.registerState("firstState", _state);
			
			_sm.unregisterState("firstState");
		}
		
		[Test]
		public function registerStateTransitionTest():void
		{
			_sm.registerTransition("test", _transition);
		}
		
		[Test]
		public function updateStatesTest():void
		{
			_sm.registerState("firstState", _state);
			
			_sm.update();
		}
		
		[Test(async)]
		public function changeStateTest():void
		{
			_sm.registerState("firstState", _state);
			_sm.registerTransition("testTransition", _transition);
			
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
			_sm.registerState("firstState", _mockState);
			_sm.registerState("secondState", _state);
			_sm.registerTransition("testTransition", _transition);
			
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
			assertThat(_sm.stateId, equalTo("secondState"));
		}
	}
}
