//
//  CacheStore.swift
//  CoinQuotor
//
//  Created by syaku on 2018/10/04.
//  Copyright © 2018年 syaku. All rights reserved.
//

import Foundation

import DefaultsKit

class CacheStore {
    private static let sharedInstance = CacheStore()
    private let defaults: Defaults
    private let exKey: Key<String>

    private let pairKey: Key<String>
    private init() {
        self.defaults = Defaults()
        self.exKey = Key<String>("cacheExKey")
        self.pairKey = Key<String>("cachePairKey")
    }
    
    class func setPair(pair: String) {
        sharedInstance.defaults.set(pair, for: sharedInstance.pairKey)
    }
    
    class func getPair() -> String? {
        return sharedInstance.defaults.get(for: sharedInstance.pairKey)
    }
    
    class func setExchange(ex: String) {
        sharedInstance.defaults.set(ex, for: sharedInstance.exKey)
    }
    
    class func getExchange() -> String? {
        return sharedInstance.defaults.get(for: sharedInstance.exKey)
    }
}
