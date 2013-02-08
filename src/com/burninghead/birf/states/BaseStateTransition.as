package com.burninghead.birf.states
{
	/**
	 * @author tomas.augustinovic
	 */
	public class BaseStateTransition implements IStateTransition
	{
		private var _fromId:Object;
		private var _toId:Object;
		
		public function BaseStateTransition(fromStateId:Object, toStateId:Object)
		{
			_fromId = fromStateId;
			_toId = toStateId;
		}

		public function get fromStateId():Object
		{
			return _fromId;
		}

		public function get toStateId():Object
		{
			return _toId;
		}
	}
}
