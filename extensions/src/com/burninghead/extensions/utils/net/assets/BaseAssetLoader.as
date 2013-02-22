package com.burninghead.extensions.utils.net.assets
{
	import com.burninghead.birf.utils.ObjectUtil;
	import com.burninghead.birf.utils.net.assets.IAsset;
	import com.burninghead.birf.utils.net.assets.IAssetLoader;
	import com.burninghead.birf.utils.net.assets.IAssetParser;
	import com.burninghead.extensions.utils.net.assets.parsers.GenericAssetParser;
	import com.burninghead.extensions.utils.net.assets.parsers.Mp3AssetParser;
	import com.burninghead.extensions.utils.net.assets.parsers.SwfAssetParser;
	import com.greensock.events.LoaderEvent;
	import com.greensock.loading.BinaryDataLoader;
	import com.greensock.loading.CSSLoader;
	import com.greensock.loading.DataLoader;
	import com.greensock.loading.ImageLoader;
	import com.greensock.loading.LoaderMax;
	import com.greensock.loading.MP3Loader;
	import com.greensock.loading.SWFLoader;
	import com.greensock.loading.VideoLoader;
	import com.greensock.loading.XMLLoader;
	import com.greensock.loading.core.LoaderCore;
	import com.greensock.loading.data.LoaderMaxVars;

	import org.osflash.signals.ISignal;
	import org.osflash.signals.Signal;

	/**
	 * @author tomas.augustinovic
	 */
	public class BaseAssetLoader implements IAssetLoader
	{
		private var _totalComplete:Signal;
		private var _totalProgress:Signal;
		private var _totalError:Signal;
		private var _itemComplete:Signal;
		private var _itemProgress:Signal;
		private var _itemFailed:Signal;
		private var _config:LoaderMaxVars;
		private var _loader:LoaderMax;
		private var _assets:Vector.<IAsset>;
		private var _parsers:Vector.<IAssetParser>;
		
		public function BaseAssetLoader()
		{
			_assets = new Vector.<IAsset>();
			_parsers = new Vector.<IAssetParser>();
			
			registerAssetParsers();
			
			_totalComplete = new Signal();
			_totalProgress = new Signal();
			_totalError = new Signal();
			_itemComplete = new Signal();
			_itemProgress = new Signal();
			_itemFailed = new Signal();

			//	Create configuration for loader.
			_config = new LoaderMaxVars();
			_config.name("baseAssetLoader");
			_config.maxConnections(1);
			_config.onComplete(onLoaderComplete);
			_config.onProgress(onLoaderProgress);
			_config.onError(onError);
			_config.onFail(onError);
			_config.onIOError(onError);
			_config.onScriptAccessDenied(onError);
			_config.onChildComplete(onItemComplete);
			_config.onChildProgress(onItemProgress);
			_config.onChildFail(onItemError);
		}
		
		protected function registerAssetParsers():void
		{
			registerAssetParser(new GenericAssetParser());
			registerAssetParser(new SwfAssetParser());
			registerAssetParser(new Mp3AssetParser());
		}
		
		public function registerAssetParser(parser:IAssetParser):void
		{
			if (parser != null)
			{
				_parsers.push(parser);
			}
		}
		
		public function unregisterAssetParser(parser:IAssetParser):void
		{
			if (_parsers.indexOf(parser) >= 0)
			{
				_parsers = _parsers.splice(_parsers.indexOf(parser), 1);
			}
		}
		
		public function load(urls:Vector.<String>, flushContent:Boolean = false):void
		{
			LoaderMax.activate([ SWFLoader, XMLLoader, DataLoader, BinaryDataLoader, CSSLoader, ImageLoader, MP3Loader, VideoLoader ]);
			
			_loader = LoaderMax.parse(ObjectUtil.toArray(urls), _config);
			_loader.load(flushContent);
		}
		
		public function getAssetByUrl(url:String):IAsset
		{
			for each (var asset:IAsset in _assets)
			{
				if (asset.url == url)
				{
					return asset;
				}
			}
			
			return null;
		}

		public function getAssetByName(name:String):IAsset
		{
			for each (var asset:IAsset in _assets)
			{
				if (asset.name == name)
				{
					return asset;
				}
			}
			
			return null;
		}

		public function cancel():void
		{
			_loader.cancel();
		}

		private function onItemError(event:LoaderEvent):void
		{
			_itemFailed.dispatch(event.type, event.text);
		}

		private function onItemProgress(event:LoaderEvent):void
		{
			_itemProgress.dispatch(event.target.progress);
		}

		private function onItemComplete(event:LoaderEvent):void
		{
			var asset:IAsset = null;
			
			for each (var parser:IAssetParser in _parsers)
			{
				asset = parser.parse(event.target as LoaderCore);
				if (asset != null)
				{
					break;
				}
			}
			
			if (asset != null)
			{
				_assets.push(asset);
			}
			else
			{
				throw new Error("Asset loader cannot determine loaded asset type.");
			}
			
			_itemComplete.dispatch();
		}

		private function onLoaderProgress(event:LoaderEvent):void
		{
			_totalProgress.dispatch(event.target.progress);
		}

		private function onLoaderComplete(event:LoaderEvent):void
		{
			_totalComplete.dispatch();
		}

		private function onError(event:LoaderEvent):void
		{
			_totalError.dispatch(event.type, event.text);
		}

		public function get totalComplete():ISignal
		{
			return _totalComplete;
		}

		public function get totalProgress():ISignal
		{
			return _totalProgress;
		}
		
		public function get totalError():ISignal
		{
			return _totalError;
		}

		public function get itemComplete():ISignal
		{
			return _itemComplete;
		}

		public function get itemProgress():ISignal
		{
			return _itemProgress;
		}

		public function get itemFailed():ISignal
		{
			return _itemFailed;
		}
	}
}
