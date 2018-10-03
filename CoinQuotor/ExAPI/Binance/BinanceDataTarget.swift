//
//  BinanceDataTarget.swift
//  CoinQuotor
//
//  Created by syaku on 2018/10/04.
//  Copyright © 2018年 syaku. All rights reserved.
//

import Foundation
import Moya
import RxCocoa
import RxSwift

enum BinanceDataTarget {
    case lastPrice(pair: String)
    case pairs()
}

extension BinanceDataTarget: TargetType {
    var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }
    
    var baseURL:URL {
        return URL.init(string: "https://api.binance.com/api")!
    }
    
    var path: String {
        switch self {
        case .lastPrice(_):
            return "/v3/ticker/price"
        case .pairs():
            return "/v1/exchangeInfo"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Task {
        switch self {
        case .lastPrice(let pair):
            return .requestParameters(parameters: [
                "symbol": pair
                ], encoding: URLEncoding.queryString)
        case .pairs:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
}
