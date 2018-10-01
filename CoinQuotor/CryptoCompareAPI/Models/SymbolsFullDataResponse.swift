//
//  SymbolsFullDataResponse.swift
//  CryptoCompareApi
//
//  Created by Yevhen Velizhenkov on 9/2/18.
//  Copyright © 2018 tapkain. All rights reserved.
//
import Foundation

public struct SymbolsFullDataResponse: Decodable {
  public typealias CurrencyTradingInfo = [String: TradingInfo]
  public typealias CoinData = [String: CurrencyTradingInfo]
  
  enum CodingKeys: String, CodingKey {
    case raw = "RAW"
    case display = "DISPLAY"
  }
  
  public let raw: CoinData
  public let display: CoinData
  
  public struct TradingInfo: Decodable {
    enum CodingKeys: String, CodingKey {
      case type = "TYPE"
      case market = "MARKET"
      case fromSymbol = "FROMSYMBOL"
      case toSymbol = "TOSYMBOL"
      case flags = "FLAGS"
      case price = "PRICE"
      case lastUpdate = "LASTUPDATE"
      case lastVolume = "LASTVOLUME"
      case lastVolumeTo = "LASTVOLUMETO"
      case lastTradeId = "LASTTRADEID"
      case volumeDay = "VOLUMEDAY"
      case volumeDayTo = "VOLUMEDAYTO"
      case volume24Hour = "VOLUME24HOUR"
      case volume24HourTo = "VOLUME24HOURTO"
      case openDay = "OPENDAY"
      case highDay = "HIGHDAY"
      case lowDay = "LOWDAY"
      case open24Hour = "OPEN24HOUR"
      case high24Hour = "HIGH24HOUR"
      case low24Hour = "LOW24HOUR"
      case lastMarket = "LASTMARKET"
      case change24Hour = "CHANGE24HOUR"
      case changePct24Hour = "CHANGEPCT24HOUR"
      case changeDay = "CHANGEDAY"
      case changePctDay = "CHANGEPCTDAY"
      case supply = "SUPPLY"
      case marketCap = "MKTCAP"
      case totalVolume24Hour = "TOTALVOLUME24H"
      case totalVolume24HourTo = "TOTALVOLUME24HTO"
    }
    
    public let type: String?
    public let market: String
    public let fromSymbol: String
    public let toSymbol: String
    public let flags: ValueParameter?
    public let price: ValueParameter
    public let lastUpdate: ValueParameter
    public let lastVolume: ValueParameter
    public let lastVolumeTo: ValueParameter
    public let lastTradeId: ValueParameter
    public let volumeDay: ValueParameter?
    public let volumeDayTo: ValueParameter?
    public let volume24Hour: ValueParameter
    public let volume24HourTo: ValueParameter
    public let openDay: ValueParameter?
    public let highDay: ValueParameter?
    public let lowDay: ValueParameter?
    public let open24Hour: ValueParameter
    public let high24Hour: ValueParameter
    public let low24Hour: ValueParameter
    public let lastMarket: String?
    public let change24Hour: ValueParameter
    public let changePct24Hour: ValueParameter
    public let changeDay: ValueParameter
    public let changePctDay: ValueParameter
    public let supply: ValueParameter?
    public let marketCap: ValueParameter?
    public let totalVolume24Hour: ValueParameter?
    public let totalVolume24HourTo: ValueParameter?
  }
}
