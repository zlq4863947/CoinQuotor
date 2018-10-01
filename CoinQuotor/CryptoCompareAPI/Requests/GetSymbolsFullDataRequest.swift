//
//  GetSymbolsFullDataRequest.swift
//  CryptoCompareApiTests
//
//  Created by Yevhen Velizhenkov on 9/2/18.
//  Copyright © 2018 tapkain. All rights reserved.
//

import Foundation

public struct GetSymbolsFullDataRequest: APIRequest {
  public typealias Response = SymbolsFullDataResponse
  
  public var resourceName: String {
    return "pricemultifull"
  }
  
  let fsyms: String
  let tsyms: String
  let e: Exchange?
  let tryConversion: Bool?
  
  public init(fsyms: String,
              tsyms: String,
              e: Exchange? = nil,
              tryConversion: Bool? = nil) {
    self.fsyms = fsyms
    self.tsyms = tsyms
    self.e = e
    self.tryConversion = tryConversion
  }
}
