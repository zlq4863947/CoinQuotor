//
//  GetCustomAverage.swift
//  CryptoCompareApi
//
//  Created by Yevhen Velizhenkov on 9/8/18.
//  Copyright © 2018 tapkain. All rights reserved.
//

import Foundation

public struct GetCustomAverageRequest: APIRequest {
  public typealias Response = CustomAverageResponse
  
  public var resourceName: String {
    return "generateAvg"
  }
  
  let fsym: String
  let tsym: String
  let e: Exchange
  
  public init(fsym: String,
              tsym: String,
              e: Exchange) {
    self.fsym = fsym
    self.tsym = tsym
    self.e = e
  }
}
