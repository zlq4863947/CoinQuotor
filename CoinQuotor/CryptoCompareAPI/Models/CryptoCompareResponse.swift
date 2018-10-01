//
//  CryptoCompareResponse.swift
//  CryptoCompareApi
//
//  Created by Yevhen Velizhenkov on 8/29/18.
//  Copyright © 2018 tapkain. All rights reserved.
//

import Foundation

struct CryptoCompareResponse<Response: Decodable>: Decodable {
  enum CodingKeys: String, CodingKey {
    case response = "Response"
    case message = "Message"
    case data = "Data"
  }
  
  var response: String?
  var message: String?
  
  let data: Response
  
  public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    do {
      response = try container.decode(String?.self, forKey: .response)
      message = try container.decodeIfPresent(String.self, forKey: .message)
      
      if let response = response {
        if response != "Success" {
          throw CryptoCompareError.server(message: message ?? "")
        }
      } else if let message = message, message != "Success" {
        throw CryptoCompareError.server(message: message)
      }
      
      data = try container.decode(Response.self, forKey: .data)
      
    } catch _ as DecodingError {
      let dataContainer = try decoder.singleValueContainer()
      data = try dataContainer.decode(Response.self)
    }
  }
}
