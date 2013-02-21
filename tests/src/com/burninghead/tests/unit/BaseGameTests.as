package com.burninghead.tests.unit
{
	import com.burninghead.birf.BaseGame;
	import com.burninghead.tests.TestRunner;

	import org.flexunit.assertThat;
	import org.hamcrest.object.notNullValue;

	/**
	 * @author tomas.augustinovic
	 */
	public class BaseGameTests
	{
		private var _game:BaseGame;

		[Before]
		public function runBeforeEachTest():void
		{
			//	Create instance of BaseGame.
			_game = new BaseGame();
			
			//	Add instance to stage container.
			TestRunner.stageContainer.addChild(_game);
		}
		
		[After]
		public function runAfterEveryTest():void
		{
			//	Remove from stage container.
			TestRunner.stageContainer.removeChild(_game);
			
			_game = null;
		}
		
		[Test]
		public function testControllerNotNull():void
		{
			assertThat(_game.controller, notNullValue());
		}
		
		[Test]
		public function testModelNotNull():void
		{
			assertThat(_game.model, notNullValue());
		}
		
		[Test]
		public function testViewNotNull():void
		{
			assertThat(_game.view, notNullValue());
		}
		
		[Test]
		public function testMessageHandlerNotNull():void
		{
			assertThat(_game.messageHandler, notNullValue());
		}
	}
}
