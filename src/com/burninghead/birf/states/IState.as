package com.burninghead.birf.states
{
	import org.osflash.signals.ISignal;
	/**
	 * Describe a state in a state machine. Allows implementation of functionality for entering/exiting/updating the state.
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
	public interface IState
	{
		/**
		 * Called when the state machine changes to this state.
		 * Called after the previous state's exit has run.
		 */
		function enter():void;
		/**
		 * Called when the state machine changes to another state from
		 * this state. Called before the new state's enter is invoked.
		 */
		function exit():void;
		/**
		 * Update is called when the state machine receives a update
		 * request. The interval of updates is completely up to the
		 * state machine implementation.
		 */
		function update():void;
		/**
		 * Return signal that indicates if this state wants to transition
		 * into a new state.
		 * @return Reference to signal.
		 */
		function get transition():ISignal;
	}
}
