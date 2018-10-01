//
//  GetSymbolPriceRequest.swift
//  CryptoCompareApi
//
//  Created by Yevhen Velizhenkov on 8/29/18.
//  Copyright © 2018 tapkain. All rights reserved.
//

import Foundation

public struct GetSymbolPriceRequest: APIRequest {
  public typealias Response = [String: Decimal]
  
  public var resourceName: String {
    return "price"
  }
  
  let fsym: String
  let tsyms: String
  let e: Exchange?
  
  public init(fsym: String,
       tsyms: String,
       e: Exchange? = nil) {
    self.fsym = fsym
    self.tsyms = tsyms
    self.e = e
  }
}
