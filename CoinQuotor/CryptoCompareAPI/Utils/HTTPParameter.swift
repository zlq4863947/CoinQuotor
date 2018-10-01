//
//  ValueParameter.swift
//  CryptoCompareApi
//
//  Created by Yevhen Velizhenkov on 8/30/18.
//  Copyright © 2018 tapkain. All rights reserved.
//

import Foundation

public enum HTTPParameter: CustomStringConvertible, Decodable {
  case string(String)
  case double(Double)
  case int(Int)
  case bool(Bool)
  
  public init(from decoder: Decoder) throws {
    let container = try decoder.singleValueContainer()
    
    if let string = try? container.decode(String.self) {
      self = .string(string)
    } else if let bool = try? container.decode(Bool.self) {
      self = .bool(bool)
    } else if let int = try? container.decode(Int.self) {
      self = .int(int)
    } else if let double = try? container.decode(Double.self) {
      self = .double(double)
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
  
  public var intValue: Int? {
    switch self {
    case .int(let int):
      return int
      
    default:
      return nil
    }
  }
  
  public var boolValue: Bool? {
    switch self {
    case .bool(let bool):
      return bool
      
    default:
      return nil
    }
  }
  
  public var description: String {
    switch self {
    case .string(let string):
      return string
    case .bool(let bool):
      return String(describing: bool)
    case .int(let int):
      return String(describing: int)
    case .double(let double):
      return String(describing: double)
    }
  }
}
