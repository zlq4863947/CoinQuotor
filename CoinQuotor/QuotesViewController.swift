//
//  QuotesViewController.swift
//  CoinQuotor
//
//  Created by syaku on 2018/10/02.
//  Copyright © 2018年 syaku. All rights reserved.
//

import Cocoa
import AppKit

class QuotesViewController: NSViewController, NSComboBoxDelegate {

    @IBOutlet weak var exImage: NSImageView!
    @IBOutlet weak var exCombo: NSComboBox!
    @IBOutlet weak var pairCombo: NSComboBox!
    
    @IBAction func exit(_ sender: Any) {
        NSApplication.shared.terminate(sender)
    }
    
    private var appDeleagte: AppDelegate!
    private var selectedEx: Ex? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        self.pairCombo.delegate = self
        self.exCombo.delegate = self
        
        appDeleagte = NSApplication.shared.delegate as? AppDelegate
        
        if appDeleagte.ex.name == "binance" {
            exCombo.selectItem(at: 1)
        } else if appDeleagte.ex.name == "bitmex" {
            exCombo.selectItem(at: 0)        }
        updatePairCombo(ex: appDeleagte.ex)
    }
    
    func comboBoxSelectionDidChange(_ notification: Notification) {
        let comboBox: NSComboBox = (notification.object as? NSComboBox)!
        
        switch comboBox {
        case self.pairCombo:
            if let pair = comboBox.objectValueOfSelectedItem as? String {
                if selectedEx != nil {
                    appDeleagte.ex = selectedEx
                    appDeleagte.statusItem.button?.image = NSImage(named: NSImage.Name(selectedEx!.name))
                    // button.imagePosition = .imageLeft
                    CacheStore.setExchange(ex: selectedEx!.name)
                }
                CacheStore.setPair(pair: pair)
                appDeleagte.quotePair = pair
                appDeleagte.onUpdate()
            }
            break
        case self.exCombo:
            
            if let exchange = comboBox.objectValueOfSelectedItem as? String {
                let exName = exchange.lowercased()
                exImage.image = NSImage(named: NSImage.Name(exName))
                
                if exName == "binance" {
                    selectedEx = appDeleagte.binance
                    updatePairCombo(ex: selectedEx!)
                } else if exName == "bitmex" {
                    selectedEx = appDeleagte.bitmex
                    updatePairCombo(ex: selectedEx!)
                }
            }
            break
        default: break
        }
    }
    
    func updatePairCombo(ex: Ex) {
        ex.getPairs{ (res, err) in
            if res != nil {
                self.pairCombo.removeAllItems()
                self.pairCombo.addItems(withObjectValues: res!)
            }
        }
    }
}

extension QuotesViewController {
    // MARK: Storyboard instantiation
    static func freshController() -> QuotesViewController {
        //1.
        let storyboard = NSStoryboard(name: "Main", bundle: nil)
        //2.
        let identifier = "QuotesViewController"
        //3.
        guard let viewcontroller = storyboard.instantiateController(withIdentifier: identifier) as? QuotesViewController else {
            fatalError("Why cant i find QuotesViewController? - Check Main.storyboard")
        }
        return viewcontroller
    }
}
