//
//  Constants.swift
//  iCurrate
//
//  Created by Rost on 1/16/19.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation


/// ---> Api Key <--- ///
let apiKey          = "com.key.8ef99d161ecce86a1d32a54cd08a0cbd!5tsdf"


/// ---> Api Uri and params <--- ///
let apiUri          = "https://currate.ru/api/?get"
let currencyParam   = "currency_list"
let pairsParam      = "rates&pairs"
let keyParam        = "key"


/// ---> Enums <--- ///
enum RequestTypes: Int {
    case Currencies
    case Quotes
}
