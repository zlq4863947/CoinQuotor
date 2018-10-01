//
//  GetExchangesRequest.swift
//  CryptoCompareApi
//
//  Created by Yevhen Velizhenkov on 9/14/18.
//  Copyright © 2018 tapkain. All rights reserved.
//

import Foundation

public struct GetExchangesRequest: APIRequest {
  public typealias Response = [String: [String: [String]]]
  
  public var resourceName: String {
    return "all/exchanges"
  }
  
  public init() {}
}
