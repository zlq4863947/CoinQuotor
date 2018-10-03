//
//  BinaryFloatingPoint.swift
//  CoinQuotor
//
//  Created by syaku on 2018/10/03.
//  Copyright © 2018年 syaku. All rights reserved.
//

import Foundation

extension Double {
    var cleanValue: String {
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : self.avoidNotation
    }
    
    var avoidNotation: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.maximumFractionDigits = 8
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(for: self) ?? ""
    }
}
