//
//  GetSymbolsPriceRequest.swift
//  CryptoCompareApi
//
//  Created by Yevhen Velizhenkov on 8/29/18.
//  Copyright © 2018 tapkain. All rights reserved.
//

import Foundation

public struct GetSymbolsPriceRequest: APIRequest {
  public typealias Response = [String: GetSymbolPriceRequest.Response]
  
  public var resourceName: String {
    return "pricemulti"
  }
  
  let fsyms: String
  let tsyms: String
  let e: Exchange?
  
  public init(fsyms: String,
       tsyms: String,
       e: Exchange? = nil) {
    self.fsyms = fsyms
    self.tsyms = tsyms
    self.e = e
  }
}
