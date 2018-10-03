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

    @IBOutlet weak var exCombo: NSComboBox!
    @IBOutlet weak var pairCombo: NSComboBox!
    
    @IBAction func exit(_ sender: Any) {
        NSApplication.shared.terminate(sender)
    }
    
    private var appDeleagte: AppDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        self.pairCombo.delegate = self
        
        appDeleagte = NSApplication.shared.delegate as? AppDelegate
        appDeleagte.bitmex.getPairs{ (res, err) in
            if res != nil {
                self.pairCombo.addItems(withObjectValues: res!)
            }
        }
    }
    
    func comboBoxSelectionDidChange(_ notification: Notification) {
        let comboBox: NSComboBox = (notification.object as? NSComboBox)!
        if comboBox == self.pairCombo {
            let pair = comboBox.objectValueOfSelectedItem as! String
            CacheStore.setPair(pair: pair)
            appDeleagte.quotePair = pair
            appDeleagte.onUpdate()
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
