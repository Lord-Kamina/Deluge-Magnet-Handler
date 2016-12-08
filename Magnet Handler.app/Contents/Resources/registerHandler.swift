#!/usr/bin/swift

import Foundation
import Cocoa

let currentHandler = LSCopyDefaultHandlerForURLScheme("magnet" as CFString)!.takeUnretainedValue() as String;

if ("org.deluge.magneturihandler" != currentHandler) {
    print("MagnetURIHandler is not registered to handle magnets; fixing that now.");
    LSSetDefaultHandlerForURLScheme("magnet" as CFString, "org.deluge.magneturihandler" as CFString);
}
else {
    print("MagnetURIHandler is already registered to handle magnets.");
}