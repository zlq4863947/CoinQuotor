//
//  HistoricalDataResponse.swift
//  CryptoCompareApi
//
//  Created by Yevhen Velizhenkov on 9/3/18.
//  Copyright © 2018 tapkain. All rights reserved.
//

import Foundation

public typealias HistoricalDataResponse = [HistoryEntry]

public struct HistoryEntry: Decodable {
  enum CodingKeys: String, CodingKey {
    case time, close, high, low, open
    case volumeFrom = "volumefrom"
    case volumeTo = "volumeto"
  }
  
  public let time: Int
  public let close: Double
  public let high: Double
  public let low: Double
  public let open: Double
  public let volumeFrom: Double
  public let volumeTo: Double
}
