//
//  BitMEX.swift
//  CoinQuotor
//
//  Created by syaku on 2018/10/02.
//  Copyright © 2018年 syaku. All rights reserved.
//

import Foundation
import Moya
import RxSwift

let disposeBag = DisposeBag()

class BitMEX {
    let provider = MoyaProvider<BitMEXDataTarget>()//(plugins: [NetworkLoggerPlugin(verbose: true)])
    
    private func request(target: BitMEXDataTarget, completed: @escaping (Data?, Error?) -> () ) {
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
    
    func getLastPrice(pair: String, completed: @escaping (Double?, Error?) -> ()) {
        request(target: .lastPrice(pair: pair)) { (res, err) in
            if res != nil {
                do {
                    let instruments = try JSONDecoder().decode([Instrument].self, from: res! )
                    completed(instruments[0].lastPrice, nil)
                } catch {
                    completed(nil, APIError.castError("getLastPrice converting data error!"))
                }
            } else {
                completed(nil, err)
            }
        }
    }
    
    func getPairs(completed: @escaping ([String]?, Error?) -> ()) {
        request(target: .pairs()) { (res, err) in
            if res != nil {
                do {
                    let instruments = try JSONDecoder().decode([Instrument].self, from: res! )
                    let pairs = instruments.compactMap { instrument -> String? in
                        if !instrument.capped {
                            return instrument.symbol
                        }
                        return nil
                    }
                    completed(pairs, nil)
                } catch {
                    completed(nil, APIError.castError("getLastPrice converting data error!"))
                }
            } else {
                completed(nil, err)
            }
        }
    }
}
