package com.burninghead.swarmdemo.states
{
	import com.burninghead.swarmdemo.view.mediators.SwarmMediator;
	import com.burninghead.birf.states.BaseState;
	import com.burninghead.birf.states.IState;
	import com.burninghead.birf.view.IView;
	import com.burninghead.birf.view.bitmaprenderer.IBitmapRenderer;
	import com.burninghead.swarmdemo.view.comps.SwarmView;
	/**
	 * @author tomas.augustinovic
	 */
	public class SwarmViewState extends BaseState implements IState
	{
		[Inject] public var renderer:IBitmapRenderer;
		[Inject] public var view:IView;
		
		private var _swarm:SwarmView;
		private var _swarmMediator:SwarmMediator;
		
		public function SwarmViewState()
		{
		}
		
		override public function enter():void
		{
			_swarm = new SwarmView(renderer);
			_swarm.createRobins();
			
			_swarmMediator = view.getMediator(SwarmMediator) as SwarmMediator;
			_swarmMediator.registerView(_swarm);
		}
		
		override public function exit():void
		{
			_swarmMediator.dispose();
			_swarm.dispose();
		}
	}
}
