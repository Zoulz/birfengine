package com.burninghead.birf.states
{
	/**
	 * @author tomas.augustinovic
	 */
	public class BaseStateTransition implements IStateTransition
	{
		private var _fromId:String;
		private var _toId:String;
		
		public function BaseStateTransition(fromStateId:String, toStateId:String)
		{
			_fromId = fromStateId;
			_toId = toStateId;
		}

		public function get fromStateId():String
		{
			return _fromId;
		}

		public function get toStateId():String
		{
			return _toId;
		}
	}
}
