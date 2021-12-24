//
//  AppDelegate.swift
//  EggTimer
//
//  Created by Gabriel Chammas on 12/23/21.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var startTimerMenuItem: NSMenuItem!
    
    @IBOutlet weak var stopTimerMenuItem: NSMenuItem!
    
    @IBOutlet weak var resetTimerMenuItem: NSMenuItem!
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }


}

