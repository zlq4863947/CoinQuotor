//
//  BitMEXDataTarget.swift
//  CoinQuotor
//
//  Created by syaku on 2018/10/03.
//  Copyright © 2018年 syaku. All rights reserved.
//

import Foundation
import Moya
import RxCocoa
import RxSwift

enum BitMEXDataTarget {
    case lastPrice(pair: String)
    case pairs()
}

extension BitMEXDataTarget: TargetType {
    var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }
    
    var baseURL:URL {
        return URL.init(string: "https://www.bitmex.com/api/v1")!
    }
    
    var path: String {
        switch self {
        case .lastPrice(_):
            return "/instrument"
        case .pairs():
            return "/instrument/active"
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
