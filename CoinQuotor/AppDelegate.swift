//
//  AppDelegate.swift
//  CoinQuotor
//
//  Created by syaku on 2018/10/01.
//  Copyright © 2018年 syaku. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    let statusItem = NSStatusBar.system.statusItem(withLength: 150)
    let popover = NSPopover()
    var eventMonitor: EventMonitor?
    var timer: Timer! = nil
    let api = CryptoCompareAPI(applicationName: "MyApp")
    let request = GetSymbolPriceRequest(fsym: "XBTUSD", tsyms: "USD", e: .bitmex)

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        if let button = statusItem.button {
            button.image = NSImage(named: NSImage.Name("bitmex")) // StatusBarButtonImage
            button.imagePosition = .imageLeft
            // button.title = "XBTUSD - 6615.0"// EOS - 0.0008947
            button.action = #selector(togglePopover(_:))// #selector(printQuote)
        }
        
        popover.contentViewController = QuotesViewController.freshController()
        
        eventMonitor = EventMonitor(mask: [.leftMouseDown, .rightMouseDown]) { [weak self] event in
            if let strongSelf = self, strongSelf.popover.isShown {
                strongSelf.closePopover(sender: event)
            }
        }
        
        // defaultの優先度で非同期処理する
        DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async {
            // データを取得する
            self.onUpdate()
        }
        // 1秒ごとデータを更新する
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.onUpdate), userInfo: nil, repeats: true)
    }
    
    @objc func onUpdate() {
        api.send(request) {
            switch $0 {
            case .success(let prices):
                // Process prices here
                if ((prices.first?.value) != nil) {
                    let price = prices.first!.value
                    DispatchQueue.main.async { // Make sure you're on the main thread here
                        self.statusItem.button?.title = "XBTUSD - \(price)"
                    }
                    // print(prices.first?.value as! Decimal)
                    // print(prices.first?.value as Any)
                }
            case .failure(let error):
                // Handle error state
                print(error.description)
            }
        }
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    @objc func togglePopover(_ sender: Any?) {
        if popover.isShown {
            closePopover(sender: sender)
        } else {
            showPopover(sender: sender)
        }
    }
    
    func showPopover(sender: Any?) {
        if let button = statusItem.button {
            eventMonitor?.start()
            popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
        }
    }
    
    func closePopover(sender: Any?) {
        eventMonitor?.stop()
        popover.performClose(sender)
    }
}

