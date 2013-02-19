package com.burninghead.tests
{
	import flexunit.framework.Assert;

	import com.burninghead.TestRunner;
	import com.burninghead.birf.BaseGame;

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
			Assert.assertNotNull(_game.controller);
		}
		
		[Test]
		public function testModelNotNull():void
		{
			Assert.assertNotNull(_game.model);
		}
		
		[Test]
		public function testViewNotNull():void
		{
			Assert.assertNotNull(_game.view);
		}
		
		[Test]
		public function testMessageHandlerNotNull():void
		{
			Assert.assertNotNull(_game.messageHandler);
		}
	}
}
