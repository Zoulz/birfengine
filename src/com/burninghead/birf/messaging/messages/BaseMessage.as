package com.burninghead.birf.messaging.messages
{
	import com.burninghead.birf.messaging.IMessage;
	/**
	 * Base message class. Implements the barebones of a message.
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
	public class BaseMessage implements IMessage
	{
		private var _type:String;
		private var _sender:*;
		private var _payload:*;
		
		/**
		 * Setup references to supplied parameters.
		 */
		public function BaseMessage(type:String, sender:*, payload:* = null)
		{
			_type = type;
			_sender = sender;
			_payload = payload;
		}
		
		/**
		 * @inheritDoc
		 */
		public function get type():String
		{
			return _type;
		}

		/**
		 * @inheritDoc
		 */
		public function get sender():*
		{
			return _sender;
		}

		/**
		 * @inheritDoc
		 */
		public function get payload():*
		{
			return _payload;
		}
	}
}
