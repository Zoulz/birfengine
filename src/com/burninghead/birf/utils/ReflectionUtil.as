package com.burninghead.birf.utils
{
	import com.burninghead.birf.utils.misc.KeyValuePair;

	import flash.system.ApplicationDomain;
	import flash.utils.describeType;
	import flash.utils.getQualifiedClassName;
	
	/**
	 * Collection of reflection related utility functions.
	 * 
	 * @author tomas.augustinovic
	 */
	public final class ReflectionUtil
	{
		/**
		 * Return the type name of the supplied object as a string.
		 * 
		 * @param obj Object to process.
		 * @return String
		 */
		public static function getNameOfObject(obj:*, nameOnly:Boolean = false):String
		{
			if (obj == null)
			{
				return "";
			}
			
			var objName:String = String(describeType(obj).@name);
			
			if (nameOnly)
			{
				return objName.substr(objName.lastIndexOf("::") + 2);
			}
			
			return objName;
		}
		
		/**
		 * Determines if the supplied object implements the specified interface.
		 * 
		 * @param obj Object to process.
		 * @param implementCls Interface definition to check for.
		 * @return Boolean
		 */
		public static function isType(obj:*, type:Class):Boolean
		{
			if (obj == null || type == null)
			{
				return false;
			}
			
			var desc:XML = describeType(obj);
			var typeName:String = getQualifiedClassName(type);
			
			return Boolean(desc.factory.extendsClass.@type.contains(typeName) || desc.factory.implementsInterface.@type.contains(typeName));
		}
		
		/**
		 * Search supplied object for member variables which have metadata and
		 * return them as untyped objects in a array.
		 * 
		 * @param obj Object to search.
		 * @param metaType Metadata type name to look for.
		 * @return Array containing Object {name, type, ref, args}
		 */
		public static function findMetaData(obj:Object, metaType:String):Array
		{
			var objXml:XML = describeType(obj);
			var ret:Array = [];
			
			for each (var vari:XML in objXml.variable)
			{
				for each (var metaData:XML in vari.metadata)
				{
					if (String(metaData.@name) == metaType)
					{
						var varName:String = String(vari.@name);
						var varType:String = String(vari.@type);
						var varRef:* = obj[varName];
						var varArgs:Array = [];
						for each (var arg:XML in metaData.arg)
						{
							varArgs.push(new KeyValuePair(String(arg.@key), String(arg.@value)));
						}
						
						var obj:Object = { name: varName, type: varType, ref: varRef, args: varArgs };
						ret.push(obj);
					}
				}
			}
			
			return ret;
		}
		
		/**
		 * Extract the class definition by string representation.
		 * 
		 * @param className Name of the class to get.
		 * @param appDomain ApplicationDomain to fetch the definition from.
		 * @return Class
		 */
		public static function getClass(className:String, appDomain:ApplicationDomain = null):Class
		{
			try
			{
				if (appDomain == null)
				{
					return ApplicationDomain.currentDomain.getDefinition(className) as Class;
				}
				
				return appDomain.getDefinition(className) as Class;
			}
			catch (error:Error)
			{
			}
			
			return null;
		}
		
		/**
		 * Simply return instance of class definition with parameterless constructor.
		 * @param clazz Class to instantiate.
		 * @return *
		 */
		public static function getInstance(clazz:Class):*
		{
			return new clazz();
		}
		
		/**
		 * Return instance of the class with the supplied name. Constructor must be
		 * parameterless.
		 * @param className Name of the class to instantiate.
		 * @param appDomain Application domain that contains the class.
		 * @return *
		 */
		public static function getInstanceByName(className:String, appDomain:ApplicationDomain = null):*
		{
			var clazz:Class = getClass(className, appDomain);
			if (clazz != null)
			{
				return new clazz();
			}
			
			return null;
		}
	}
}
