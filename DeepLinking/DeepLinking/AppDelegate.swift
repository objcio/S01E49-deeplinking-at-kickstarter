//
//  AppDelegate.swift
//  DeepLinking
//
//  Created by Florian Kugler on 03-04-2017.
//  Copyright © 2017 objc.io. All rights reserved.
//

import UIKit
let scheme = "io.objc.deeplinking"

enum Route {
    case modal
    case tab(TabBarViewController.Tab)
    
    init?(url: URL) {
        switch url.absoluteString {
        case "\(scheme)://tab1": self = .tab(.tab1)
        case "\(scheme)://tab2": self = .tab(.tab2)
        case "\(scheme)://modal": self = .modal
        default: return nil
        }
    }
    
    init?(shortcutItem: UIApplicationShortcutItem) {
        switch shortcutItem.type {
        case "io.objc.deeplinking.tab1": self = .tab(.tab1)
        case "io.objc.deeplinking.tab2": self = .tab(.tab2)
        case "io.objc.deeplinking.modal": self = .modal
        default: return nil
        }
    }
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        if let url = launchOptions?[.url] as? URL {
            guard let route = Route(url: url) else { return false }
            handle(route: route)
        }
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        guard let route = Route(url: url) else { return false }
        handle(route: route)
        return true
    }
    
    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        guard let route = Route(shortcutItem: shortcutItem) else {
            completionHandler(false)
            return
        }
        handle(route: route)
        completionHandler(true)
    }
    
    func handle(route: Route) {
        let tabController = window?.rootViewController as! TabBarViewController
        switch route {
        case .tab(let tab): tabController.showTab(tab)
        case .modal: tabController.showModal(sender: self)
        }
    }
}

