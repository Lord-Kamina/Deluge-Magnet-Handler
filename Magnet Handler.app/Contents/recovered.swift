#!/usr/bin/swift

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
            LSSetDefaultHandlerForURLScheme("magnet" as CFString, "org.deluge.magneturihandler" as CFString);
        }
        else {
            print("MagnetURIHandler is already registered to handle magnets.");
        }
    
    case "-check":
        
    let currentHandler = LSCopyDefaultHandlerForURLScheme("magnet" as CFString)!.takeUnretainedValue() as String;
    print(currentHandler);
    
    default:
        print ("Usage: magnetHandler <command>, where <command> is one of:\n\n\t-register\t\t\t (Register MagnetURIHandler as the default handler for magnet:// URIs.)\n\t-check\t\t\t\t (Prints the bundle id for the application currently registered to handle magnet URIs)\n\nmagnetHandler with ether an invalid <command> or without arguments will print this message.");

}
