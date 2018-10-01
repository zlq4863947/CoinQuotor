//
//  CustomAverageResponse.swift
//  CryptoCompareApi
//
//  Created by Yevhen Velizhenkov on 9/10/18.
//  Copyright © 2018 tapkain. All rights reserved.
//

import Foundation

public struct CustomAverageResponse: Decodable {
  enum CodingKeys: String, CodingKey {
    case raw = "RAW"
    case display = "DISPLAY"
  }
  
  public let raw: SymbolsFullDataResponse.TradingInfo
  public let display: SymbolsFullDataResponse.TradingInfo
}
