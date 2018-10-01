//
//  ResponseValidator.swift
//  CryptoCompareApi
//
//  Created by Yevhen Velizhenkov on 8/30/18.
//  Copyright © 2018 tapkain. All rights reserved.
//

import Foundation

enum ResponseValidator {
  static func validateDataTaskResponse(_ data: Data?, _ response: URLResponse?, _ error: Error?) throws -> Data {
    if let error = error {
      throw CryptoCompareError.requestError(error: error)
    }
    
    guard let data = data else {
      throw CryptoCompareError.noData
    }
    
    guard let response = response as? HTTPURLResponse else {
      fatalError("Response is not HTTPURLResponse")
    }
    
    if response.statusCode != 200 {
      throw CryptoCompareError.badResponse(statusCode: response.statusCode)
    }
    
    return data
  }
}
