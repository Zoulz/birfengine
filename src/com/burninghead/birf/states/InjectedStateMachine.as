package com.burninghead.birf.states
{
	import org.swiftsuspenders.Injector;
	/**
	 * Provides a basic state machine with dependency injection. The supplied injector will inject all of the states added to the state
	 * machine.
	 * 
	 * <pre>
	 * -----------------------------------------------------------------------------------------------------------------------------------------
	 * 
	 * Copyright (c) Tomas Augustinovic 2012-2013
	 *
	 * Licence Agreement (The MIT License)
	 *
	 * Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files
	 * (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge,
	 * publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do
	 * so, subject to the following conditions:
	 *
	 * The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
	 *
	 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
	 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE
	 * FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
	 * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
	 * 
	 * -----------------------------------------------------------------------------------------------------------------------------------------
	 * </pre>
	 * 
	 * @author tomas.augustinovic
	 */
	public class InjectedStateMachine extends BaseStateMachine implements IStateMachine
	{
		private var _injector:Injector;
		
		/**
		 * Save reference to the supplied injector.
		 * @param injector Dependency injector.
		 */
		public function InjectedStateMachine(injector:Injector)
		{
			super();
			
			_injector = injector;
		}
		
		/**
		 * Inject the state with dependencies when it is registered.
		 * @param id Identifier of state.
		 * @param state State instance.
		 */
		override public function registerState(id:String, state:IState):void
		{
			super.registerState(id, state);
			
			if (id != null && state != null)
			{
				_injector.injectInto(state);
			}
		}
	}
}
