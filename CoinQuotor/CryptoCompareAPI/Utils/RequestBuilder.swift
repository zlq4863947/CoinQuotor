//
//  RequestBuilder.swift
//  CryptoCompareApi
//
//  Created by Yevhen Velizhenkov on 8/30/18.
//  Copyright © 2018 tapkain. All rights reserved.
//

import Foundation

enum RequestBuilder {
  static func makeURLRequest<T: APIRequest>(for request: T, baseEndpoint: String, applicationName: String?) throws -> URLRequest {
    guard let url = URL(string: baseEndpoint) else {
      throw CryptoCompareError.requestBuildingError(message: "Failed to build URL from endpoint")
    }
    
    guard var components = URLComponents(url: url.appendingPathComponent(request.resourceName), resolvingAgainstBaseURL: false) else {
      throw CryptoCompareError.requestBuildingError(message: "Failed to build URLComponents from URL")
    }
    
    let queryItems = try request.makeURLQueryItems()
    
    if let applicationName = applicationName {
      components.queryItems = queryItems + [URLQueryItem(name: "extraParams", value: applicationName)]
    } else if queryItems.count > 0 {
      components.queryItems = queryItems
    }
    
    guard let builtURL = components.url else {
      throw CryptoCompareError.requestBuildingError(message: "Failed to build URL from URLComponents")
    }
    
    return URLRequest(url: builtURL)
  }
}
