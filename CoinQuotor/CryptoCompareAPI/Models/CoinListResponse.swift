//
//  CoinListResponse.swift
//  CryptoCompareApi
//
//  Created by Yevhen Velizhenkov on 9/1/18.
//  Copyright © 2018 tapkain. All rights reserved.
//

import Foundation

public typealias CoinListResponse = [String: CoinListItem]

public struct CoinListItem: Decodable {
  // Workaround
  // Should be parsed from root response, but it's difficult to provide this url to every item
  private static let baseLink = "https://www.cryptocompare.com"
  
  enum CodingKeys: String, CodingKey {
    case id = "Id"
    case url = "Url"
    case imageUrl = "ImageUrl"
    case name = "Name"
    case symbol = "Symbol"
    case coinName = "CoinName"
    case fullName = "FullName"
    case algorithm = "Algorithm"
    case proofType = "ProofType"
    case fullyPremined = "FullyPremined"
    case totalCoinSupply = "TotalCoinSupply"
    case builtOn = "BuiltOn"
    case smartContractAddress = "SmartContractAddress"
    case preMinedValue = "PreMinedValue"
    case sortOrder = "SortOrder"
    case sponsored = "Sponsored"
    case isTrading = "IsTrading"
  }
  
  public let id: String
  public let url: URL
  public let imageUrl: URL?
  public let name: String
  public let symbol: String
  public let coinName: String
  public let fullName: String
  public let algorithm: String
  public let proofType: String
  public let fullyPremined: String
  public let totalCoinSupply: String
  public let builtOn: String
  public let smartContractAddress: String
  public let preMinedValue: String
  public let sortOrder: String
  public let sponsored: Bool
  public let isTrading: Bool
  
  public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    
    id = try container.decode(String.self, forKey: .id)
    name = try container.decode(String.self, forKey: .name)
    symbol = try container.decode(String.self, forKey: .symbol)
    coinName = try container.decode(String.self, forKey: .coinName)
    fullName = try container.decode(String.self, forKey: .fullName)
    algorithm = try container.decode(String.self, forKey: .algorithm)
    proofType = try container.decode(String.self, forKey: .proofType)
    fullyPremined = try container.decode(String.self, forKey: .fullyPremined)
    totalCoinSupply = try container.decode(String.self, forKey: .totalCoinSupply)
    builtOn = try container.decode(String.self, forKey: .builtOn)
    smartContractAddress = try container.decode(String.self, forKey: .smartContractAddress)
    preMinedValue = try container.decode(String.self, forKey: .preMinedValue)
    sortOrder = try container.decode(String.self, forKey: .sortOrder)
    sponsored = try container.decode(Bool.self, forKey: .sponsored)
    isTrading = try container.decode(Bool.self, forKey: .isTrading)
    
    let url = try container.decode(String.self, forKey: .url)
    self.url = URL(string: CoinListItem.baseLink)!.appendingPathComponent(url)
    
    if let imageUrl = try container.decodeIfPresent(String.self, forKey: .imageUrl) {
      self.imageUrl = URL(string: CoinListItem.baseLink)!.appendingPathComponent(imageUrl)
    } else {
      imageUrl = nil
    }
  }
}
