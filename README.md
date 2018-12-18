# Deluge-Magnet-Handler
### OSX Applescript handler to open magnet URLs in Deluge.app

## Current Version
    - Version: 1.3.0
    - Date: 2018-12-118

## Known Issues
- 
# Release Notes

## [1.3.0] -  2018-12-118
  + ### Changed
  	+ registerHandler: 
  		+ is provided straight as the statically-linked product of its Xcode project.
  		+ Made some cosmetic changes to the usage message.
  		+ Using -register now returns 0 on success and forwards whatever numeric error we get on failure to the AppleScript GUI.
  	+ Main bundle:
  		+ Use a more robust method to determine locations of icon files, as well as registerHandler.
  		+ The app now doesn't always presume success. The success message is only shown if registerHandler returns 0.
  		+ The whole bundle is now codesigned and linked against 10.14 SDK.


# Instructions
*Note: If on 10.14+, the application will ask for permission to control several other apps; including `Finder.app`, `System Events.app` and possibly itself (don't ask).*

1. ) Install to "Applications" folder.
2. ) Run The application once by double-clicking it on the Finder, the application will then prompt you to register itself as the default handler for torrent files.
3. ) Go to a browser and click on a magnet to test it.
