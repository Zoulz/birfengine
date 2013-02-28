package com.burninghead.birf.states
{
	/**
	 * Base class implementation of a simple transition between two states.
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
	 * @see IStateTransition
	 * 
	 * @author tomas.augustinovic
	 */
	public class BaseStateTransition implements IStateTransition
	{
		private var _fromId:String;
		private var _toId:String;
		
		/**
		 * Sets member variables.
		 * @param fromStateId The state to transition from.
		 * @param toStateId The state to transition to.
		 */
		public function BaseStateTransition(fromStateId:String, toStateId:String)
		{
			_fromId = fromStateId;
			_toId = toStateId;
		}

		/**
		 * Getter method that will return the from-state id.
		 * @return Id of the from-state.
		 */
		public function get fromStateId():String
		{
			return _fromId;
		}

		/**
		 * Returns the to-state id.
		 * @return Id of to-state.
		 */
		public function get toStateId():String
		{
			return _toId;
		}
	}
}
