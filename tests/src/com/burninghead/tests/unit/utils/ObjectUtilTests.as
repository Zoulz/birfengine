package com.burninghead.tests.unit.utils
{
	import com.burninghead.utils.ObjectUtils;

	import org.flexunit.assertThat;
	import org.hamcrest.object.equalTo;
	import org.hamcrest.object.isNotNull;

	import flash.utils.Dictionary;
	/**
	 * @author tomas.augustinovic
	 */
	public class ObjectUtilTests
	{
		[Test]
		public function mergeObjectsTest():void
		{
			var obj1:Object = { item1: "berra", item2: "kalle" };
			var obj2:Object = { item3: "ronny" };
			var result:Object = ObjectUtils.mergeObjects(obj1, obj2);
			
			assertThat(result.item1, isNotNull());
			assertThat(result.item1, equalTo("berra"));
			assertThat(result.item2, isNotNull());
			assertThat(result.item2, equalTo("kalle"));
			assertThat(result.item3, isNotNull());
			assertThat(result.item3, equalTo("ronny"));
		}
		
		[Test]
		public function toArrayTest():void
		{
			var obj:Object = { item1: "berra", item2: "kalle", item3: "ronny" };
			
			var arr:Array = [ "berra", "kalle", "ronny" ];
			
			var dic:Dictionary = new Dictionary();
			dic[0] = "berra";
			dic[1] = "kalle";
			dic[2] = "ronny";
			
			var vec:Vector.<String> = new Vector.<String>();
			vec.push("berra");
			vec.push("kalle");
			vec.push("ronny");
			
			assertThat("toArray(Object)", ObjectUtils.toArray(obj).length, equalTo(3));
			assertThat("toArray(Array)", ObjectUtils.toArray(arr).length, equalTo(3));
			assertThat("toArray(Dictionary)", ObjectUtils.toArray(dic).length, equalTo(3));
			assertThat("toArray(Vector)", ObjectUtils.toArray(vec).length, equalTo(3));
		}
		
		[Test]
		public function cloneObjectTest():void
		{
			var obj:Object = { item1: "berra", item2: "kalle", item3: "ronny" };
			var obj2:Object = ObjectUtils.clone(obj);
			
			assertThat(obj2.item1, equalTo("berra"));
			assertThat(obj2.item2, equalTo("kalle"));
			assertThat(obj2.item3, equalTo("ronny"));
		}
	}
}
