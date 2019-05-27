//
//  AppDelegate.swift
//  HypFlash
//
//  Created by Van Simmons on 5/26/19.
//  Copyright © 2019 ComputeCycles, LLC. All rights reserved.
//

import Cocoa
import Yams

struct Hypriot {
    public static var yaml: Yams.Node!
}

let sshFolderIconSource = "http://www.iconarchive.com/show/nuoveXT-2-icons-by-saki/Folder-ssh-icon.html"

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        guard let yamlPath = Bundle.main.path(forResource: "hypriot", ofType: "yml") else {
            print("Couldn't find sample path")
            return
        }
        do {
            let yamlString = try String(contentsOfFile: yamlPath)
            guard let yaml = try Yams.compose(yaml: yamlString) else { return }
            Hypriot.yaml = yaml
        } catch {
            print("Caught: \(error)")
        }
    }

    func applicationWillTerminate(_ aNotification: Notification) {
    }
}

