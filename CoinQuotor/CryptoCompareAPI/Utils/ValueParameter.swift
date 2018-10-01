//
//  CryptoCompareParameter.swift
//  CryptoCompareApi
//
//  Created by Yevhen Velizhenkov on 9/10/18.
//  Copyright © 2018 tapkain. All rights reserved.
//

import Foundation

public enum ValueParameter: Decodable {
  case string(String)
  case double(Double)
  
  public init(from decoder: Decoder) throws {
    let container = try decoder.singleValueContainer()
    
    if let string = try? container.decode(String.self) {
      self = .string(string)
    } else if let int = try? container.decode(Int.self) {
      self = .double(Double(int))
    } else if let double = try? container.decode(Double.self) {
      self = .double(double)
    } else if container.decodeNil() {
      self = .double(0.0)
    } else {
      throw CryptoCompareError.parameterTypeNotSupported
    }
  }
  
  public var doubleValue: Double? {
    switch self {
    case .double(let double):
      return double
      
    default:
      return nil
    }
  }
  
  public var stringValue: String? {
    switch self {
    case .string(let string):
      return string
      
    default:
      return nil
    }
  }
}
