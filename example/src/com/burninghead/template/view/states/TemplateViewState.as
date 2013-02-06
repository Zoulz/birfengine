package com.burninghead.template.view.states
{
	import com.burninghead.birf.model.IModel;
	import com.burninghead.birf.view.IView;
	import com.burninghead.birf.view.stage2d.states.IStage2DViewState;
	import com.burninghead.birf.view.stage2d.states.Stage2DViewState;
	import com.burninghead.template.view.SphereMediator;
	import com.burninghead.template.view.comps.SphereView;

	import flash.geom.Point;
	/**
	 * @author BigZoulz
	 */
	public class TemplateViewState extends Stage2DViewState implements IStage2DViewState
	{
		[Inject] public var model:IModel;
		[Inject] public var view:IView;
		
		private var _sphere:SphereView;
		private var _med:SphereMediator;
		
		public function TemplateViewState()
		{
			super();
		}
		
		override protected function registerTransitions():void
		{
			
		}
		
		override public function enter(params:Object):void
		{
			super.enter(params);
			
			trace("Entering: TemplateViewState");
			
			//	Create sphere view and add it.
			_sphere = new SphereView();
			container.addChild(_sphere);
			
			//	Get mediator for sphere.
			_med = view.getMediator(SphereMediator) as SphereMediator;
			_med.registerView(_sphere);
			_med.position = new Point(100, 100);
		}

		override public function exit():void
		{
			super.exit();
			
			trace("Exiting: TemplateViewState");
			
			//	Unregister the view.
			_med.dispose();
			
			//	Remove the sphere view.
			container.removeChild(_sphere);
		}
	}
}
