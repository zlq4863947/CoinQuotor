//
//  Instrument.swift
//  CoinQuotor
//
//  Created by syaku on 2018/10/03.
//  Copyright © 2018年 syaku. All rights reserved.
//

import Foundation

struct Instrument: Codable {
    let symbol: String
    let lastPrice: Double
    let capped: Bool
    
    enum CodingKeys : String, CodingKey {
        case symbol = "symbol"
        case lastPrice = "lastPrice"
        case capped = "capped"
    }
}
