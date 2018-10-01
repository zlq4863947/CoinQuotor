//
//  GetHistoricalDaily.swift
//  CryptoCompareApi
//
//  Created by Yevhen Velizhenkov on 9/3/18.
//  Copyright © 2018 tapkain. All rights reserved.
//

import Foundation

public struct GetHistoricalDailyRequest: APIRequest {
  public typealias Response = HistoricalDataResponse
  
  public var resourceName: String {
    return "histoday"
  }
  
  let fsym: String
  let tsym: String
  let e: Exchange?
  let tryConversion: Bool?
  let aggregate: Int?
  let limit: Int?
  let allData: Bool?
  let toTs: Int?
  
  public init(fsym: String,
              tsym: String,
              e: Exchange? = nil,
              aggregate: Int? = nil,
              limit: Int? = nil,
              allData: Bool? = nil,
              toTs: Int? = nil,
              tryConversion: Bool? = nil) {
    self.fsym = fsym
    self.tsym = tsym
    self.e = e
    self.aggregate = aggregate
    self.limit = limit
    self.allData = allData
    self.toTs = toTs
    self.tryConversion = tryConversion
  }
}
