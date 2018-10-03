//
//  Binance.swift
//  CoinQuotor
//
//  Created by syaku on 2018/10/04.
//  Copyright © 2018年 syaku. All rights reserved.
//

import Foundation
import Moya
import RxSwift

class Binance: Ex {
    override var name: String {
        get {
            return "binance"
        }
        set {}
    }
    
    let provider = MoyaProvider<BinanceDataTarget>()
    
    private func request(target: BinanceDataTarget, completed: @escaping (Data?, Error?) -> () ) {
        provider.rx.request(target)
            .subscribe({ event in
                switch event {
                case let .success(response):
                    completed(response.data, nil)
                case let .error(error):
                    completed(nil, error)
                }
            })
            .disposed(by: disposeBag)
    }
    
    override func getLastPrice(pair: String, completed: @escaping (Double?, Error?) -> ()) {
        request(target: .lastPrice(pair: pair)) { (res, err) in
            if res != nil {
                do {
                    let symbol = try JSONDecoder().decode(Ticker.self, from: res! )
                    completed(Double(symbol.price), nil)
                } catch {
                    completed(nil, APIError.castError("getLastPrice converting data error!"))
                }
            } else {
                completed(nil, err)
            }
        }
    }
    
    override func getPairs(completed: @escaping ([String]?, Error?) -> ()) {
        request(target: .pairs()) { (res, err) in
            if res != nil {
                do {
                    let res = try JSONDecoder().decode(Symbols.self, from: res! )
                    let pairs = res.symbols.compactMap { symbol -> String? in
                        return symbol.symbol
                    }
                    completed(pairs, nil)
                } catch {
                    completed(nil, APIError.castError("getPairs converting data error!"))
                }
            } else {
                completed(nil, err)
            }
        }
    }
}
