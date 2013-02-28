# v0.2 alpha

## API Changes

* Separated individual extensions into own folders.
* Created a general purpose package called 'utils', which is now the home to much of the stuff in the 'extensions' package.
* Put all the code for the console extension into one package.
* Renamed all utility classes to 'utils' instead of 'util'.

## API Additions

## Fixes

* Included a copy of the (MIT) license in all core classes.
* Console extension is no longer tied to displaylist views.
* Decoupled mediators from view components entirely.
* IView now implements IDisposable to allow views to clean up before being re-initialized.

## Build

* Divided ANT build scripts into separate files as number of targets grow.
* Will now use FLEX_HOME environment variable to get path to sdk.
* Echo the current and required sdk versions.
* Scripts can now build debug, release and baked versions of all the core SWCs.
* Third party libraries have been divided into debug/release versions which will be used during compilation accordingly.

## Tests

* Added tests for extension views: BitmapRendererView, DisplayListView.
* Added tests for all message handler-variants.

# v0.1 alpha

* First public release.
