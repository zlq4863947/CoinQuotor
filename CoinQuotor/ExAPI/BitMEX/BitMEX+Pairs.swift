//
//  BitMEX+Pairs.swift
//  CoinQuotor
//
//  Created by syaku on 2018/10/02.
//  Copyright © 2018年 syaku. All rights reserved.
//

import Foundation

extension BitMEX {
    enum Pair: String, Codable {
        case xbt_usd = "XBTUSD"
        case ada_z18 = "ADAZ18"
        case bch_z18 = "BCHZ18"
        case eos_z18 = "EOSZ18"
        case eth_z18 = "ETHUSD"
        case ltc_z18 = "LTCZ18"
        case trx_z18 = "TRXZ18"
        case xrp_z18 = "XRPZ18"
        
        static let all = [xbt_usd, ada_z18, bch_z18, eos_z18, eth_z18, ltc_z18, trx_z18, xrp_z18]
    }
}
