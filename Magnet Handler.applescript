on quit
	try
		tell application "System Events" to tell process "Deluge"
			activate
			set frontmost to true
			windows where title contains "Add Torrents"
			if result is not {} then perform action "AXRaise" of item 1 of result
		end tell
	end try
end quit

on open location this_URL
	try
		tell application "Finder" to set delugePath to POSIX path of (application file id "org.deluge" as string)
		set appExists to true
	on error
		set appExists to false
		display alert "Deluge.app must be installed in order to use this plug-in." as critical
		return
	end try
	set delugeArgument to quoted form of this_URL
	try
		tell application "Deluge" to activate
	end try
	do shell script (quoted form of (delugePath & "/Contents/MacOS/Deluge") & " add " & delugeArgument & "; return;")
	quit
end open location
tell application "Finder" to set thisPath to (POSIX path of (application file id "org.deluge.MagnetURIHandler" as string))
log "Magnet Handler.app info: path to Application: " & thisPath
set regTool to (quoted form of POSIX path of (path to resource "registerHandler"))
set handlerCheck to regTool & " -check"
set handlerReg to regTool & " -register"
log "Magnet Handler.app info: path to registerHandler: " & regTool
set retHandlerCheck to do shell script handlerCheck
if (retHandlerCheck contains "org.deluge.magneturihandler") then
	display dialog "Magnet Handler is already the default application to handle magnet URIs" buttons {"OK"} with title "Notification" with icon POSIX file (POSIX path of (path to resource "deluge_magnet.icns"))
else
	try
		set dialogResult to display dialog "Magnet Handler has not been configured to handle magnet URIs. Would you like to do this now?" buttons {"Yes", "No"} default button "Yes" cancel button "No" with title "Notification" with icon POSIX file (POSIX path of (path to resource "deluge_magnet.icns"))
		log dialogResult
	on error number -128
		display alert "Unable to complete operation: Error -128" as critical
		return
	end try
	try
		if (button returned) of dialogResult is "Yes" then
			set retHandlerSet to do shell script handlerReg
			if (retHandlerSet is equal to "0") then
				display dialog "Magnet Handler has now been configured as the default application to handle magnet URIs" buttons {"OK"} with title "Notification" with icon POSIX file (POSIX path of (path to resource "deluge_magnet.icns"))
			else
				display alert "We were unable to configure Magnet Handler as the default application to handle magnet URIs.
Helper returned error code: " & retHandlerSet as critical
			end if
		end if
	on error number -128
		display alert "Unable to complete operation: Error -128" as critical
		return
	end try
end if
quit