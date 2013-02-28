package com.burninghead.utils
{
	import flash.system.ApplicationDomain;
	import flash.utils.describeType;
	import flash.utils.getQualifiedClassName;
	
	/**
	 * Collection of reflection related utility functions.
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
	public final class ReflectionUtils
	{
		/**
		 * Return the type name of the supplied object as a string.
		 * @param obj Object to process.
		 * @param nameOnly True if you only want the actual class name without the package.
		 * @return Type name of the supplied object.
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
		 * Get name of function inside object.
		 * @param obj Object that contains the function who's name you want.
		 * @param f Function of the method inside the supplied object.
		 * @return Name of the function.
		 */
		public static function getNameOfFunction(obj:*, f:Function):String
		{
			var functionName:String = "error!";
			var type:XML = describeType(obj);

			for each (var node:XML in type.method)
			{
				if (obj[node.@name] == f)
				{
					functionName = node.@name;
					break;
				}
			}
			
			return functionName;
		}
		
		/**
		 * Determines if the supplied object implements the specified interface.
		 * @param obj Object to process.
		 * @param type Type to check for.
		 * @return True if the object implements the specified type.
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
		 * @param obj Object to search.
		 * @param metaType Metadata type name to look for.
		 * @return Array containing Objects with the following definition: <b>{name, type, ref, args}</b>
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
		 * @param className Name of the class to get.
		 * @param appDomain ApplicationDomain to fetch the definition from.
		 * @return Class definition, or null if unable to get definition.
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
		 * @return Instance of the supplied class.
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
		 * @return Instance of the specified class.
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
