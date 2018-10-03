//
//  Ex.swift
//  CoinQuotor
//
//  Created by syaku on 2018/10/04.
//  Copyright © 2018年 syaku. All rights reserved.
//

import Foundation
import Moya
import RxSwift

let disposeBag = DisposeBag()

class Ex {
    
    var name = "ex"
    
    func getLastPrice(pair: String, completed: @escaping (Double?, Error?) -> ()) {}
    
    func getPairs(completed: @escaping ([String]?, Error?) -> ()) {}
}
