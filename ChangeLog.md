# v0.2 alpha GREEN SLIME

## API Changes

* Separated individual extensions into own folders.
* Created a general purpose package called 'utils', which is now the home to much of the stuff in the 'extensions' package.
* Put all the code for the console extension into one package.
* Renamed all utility classes to 'utils' instead of 'util'.
* Taken out the 'rpc' and 'assets' packages from net under utils. They are now standalone packages within utils.
* Renamed the core class to 'BaseCore' instead of 'BaseGame'.
* Extensions are now placed directly under the extensions package.

## API Additions

* Added a interface for the core.

## Fixes

* Included a copy of the (MIT) license in all core classes.
* Console extension is no longer tied to displaylist views.
* Decoupled mediators from view components entirely.
* IView now implements IDisposable to allow views to clean up before being re-initialized.
* Made displaylistview console background a bit darker.

## Build

* Divided ANT build scripts into separate files as number of targets grow.
* Will now use FLEX_HOME environment variable to get path to sdk.
* Echo the current and required sdk versions.
* Scripts can now build debug, release and baked versions of all the core and utils SWCs.
* Third party libraries have been divided into debug/release versions which will be used during compilation accordingly.
* Most of the utils in the core source folder have been moved to the extensions folder instead.

## Tests

* Added tests for extension views: BitmapRendererView, DisplayListView.
* Added tests for all message handler-variants.

# v0.1 alpha

* First public release.
