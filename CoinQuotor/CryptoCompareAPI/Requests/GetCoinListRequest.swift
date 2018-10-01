//
//  GetCoinListRequest.swift
//  CryptoCompareApi
//
//  Created by Yevhen Velizhenkov on 8/29/18.
//  Copyright © 2018 tapkain. All rights reserved.
//

import Foundation

public struct GetCoinListRequest: APIRequest {
  public typealias Response = CoinListResponse
  
  public var resourceName: String {
    return "all/coinlist"
  }
  
  let builtOn: String?
  
  public init(builtOn: String? = nil) {
    self.builtOn = builtOn
  }
}
