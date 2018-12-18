import Foundation
import Cocoa

func getArgument() -> String? {
	if (2 > CommandLine.arguments.count) {
		return nil;
	}
	else {
		return CommandLine.arguments[1];
	}
}

	let command = getArgument() ?? "null";
	
	switch command {
		
	case "-register":
		let currentHandler = LSCopyDefaultHandlerForURLScheme("magnet" as CFString)!.takeUnretainedValue() as String;
		
		if ("org.deluge.magneturihandler" != currentHandler) {
			var retval: OSStatus = kLSUnknownErr;
			retval = LSSetDefaultHandlerForURLScheme("magnet" as CFString, "org.deluge.magneturihandler" as CFString);
			print(retval);
		}
		else {
			print("MagnetURIHandler is already registered to handle magnets.");
		}
		
	case "-check":
		
		let currentHandler = LSCopyDefaultHandlerForURLScheme("magnet" as CFString)!.takeUnretainedValue() as String;
		print(currentHandler);
		
	default:
		print ("\nUsage: registerHandler <command>, where <command> is one of:\n\n\t-register\t\t\t (Register 'Magnet Handler.app' as the default handler for magnet:// URIs.)\n\t-check\t\t\t\t (Prints the bundle id for the application currently registered to handle magnet URIs)\n\nRunning registerHandler with either an invalid <command> or without any arguments will print this message.\n");		
	}
