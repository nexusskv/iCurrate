//
//  LinkBuilder.swift
//  iCurrate
//
//  Created by Rost on 1/17/19.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation


class LinkBuilder {

    
    /// ---> buildLink <--- ///
    static func buildLink(_ type: Int, params: String) -> String {
        var requestUrl = ""
        switch type {
            case RequestTypes.Currencies.rawValue:
                requestUrl = apiUri + "=" + currencyParam + "&" + keyParam + "=" + prepareKey()
            case RequestTypes.Quotes.rawValue:
                requestUrl = apiUri + "=" + pairsParam + "=" + params + "&" + keyParam + "=" + prepareKey()
            default:
                break
        }
        
        return requestUrl
    }
    
    
    /// ---> prepareKey <--- ///
    static func prepareKey() -> String {
        var keyString: String   = apiKey.components(separatedBy: ".").last!
        keyString               = keyString.components(separatedBy: "!").first!
        keyString               = String(keyString.reversed())
        
        return keyString
    }
}
