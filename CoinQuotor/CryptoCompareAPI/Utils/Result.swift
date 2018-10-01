//
//  Result.swift
//  CryptoCompareApi
//
//  Created by Yevhen Velizhenkov on 8/29/18.
//  Copyright © 2018 tapkain. All rights reserved.
//

import Foundation

public enum Result<Value, Error> {
  case success(Value)
  case failure(Error)
}

public typealias ResultCallback<Value> = (Result<Value, CryptoCompareError>) -> Void
