//
//  APIRequest.swift
//  CryptoCompareApi
//
//  Created by Yevhen Velizhenkov on 8/29/18.
//  Copyright © 2018 tapkain. All rights reserved.
//

import Foundation

public protocol APIRequest: Codable {
  associatedtype Response: Decodable
  
  var resourceName: String { get }
  func makeURLQueryItems() throws -> [URLQueryItem]
}


extension APIRequest {
  public func makeURLQueryItems() throws -> [URLQueryItem] {
    let parametersData = try JSONEncoder().encode(self)
    let parameters = try JSONDecoder().decode([String: HTTPParameter].self, from: parametersData)
    
    return parameters.sorted { $0.key < $1.key }.map { URLQueryItem(name: $0.key, value: $0.value.description) }
  }
}
