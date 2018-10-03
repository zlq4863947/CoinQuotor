//
//  Symbol.swift
//  CoinQuotor
//
//  Created by syaku on 2018/10/04.
//  Copyright © 2018年 syaku. All rights reserved.
//

import Foundation

extension Binance {
    struct Ticker: Codable {
        let symbol: String
        let price: String
        
        enum CodingKeys : String, CodingKey {
            case symbol = "symbol"
            case price = "price"
        }
    }
    
    struct Symbol: Codable {
        let symbol: String
        
        enum CodingKeys : String, CodingKey {
            case symbol = "symbol"
        }
    }
    
    struct Symbols: Codable {
        let symbols: [Symbol]
        
        enum CodingKeys : String, CodingKey {
            case symbols = "symbols"
        }
    }
}
