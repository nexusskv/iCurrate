//
//  JsonHandler.swift
//  iCurrate
//
//  Created by Rost on 1/17/19.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation


class JsonHandler {
    
    
    /// ---> Handle Json Function  <--- ///
    static func handleJson(_ json: [String: Any], type: Int) -> [PairObject] {
        var handleResult: [PairObject] = []
        
        switch type {
            case RequestTypes.Currencies.rawValue:
                var pairsArray = json["data"] as! [String]

                pairsArray = pairsArray.sorted { $1 < $0 }
                
                var counter = 0
                for pairs in pairsArray {
                    let pairObject = PairObject(pairId: counter, pairTitle: pairs, isDisable: false,
                                                quoteValue: "")
                    handleResult.append(pairObject)
                    
                    counter += 1
                }

            case RequestTypes.Quotes.rawValue:
                var localPairs      = PairDefaults.getPairs()
                
                let quotesValues = json["data"] as! [String: Any]
                
                for key in quotesValues.keys {
                    let quoteValue = quotesValues[key]
                    
                    for i in 0..<localPairs.count {
                        var pairObject = localPairs[i]
                        
                        if pairObject.pairTitle == key {
                            pairObject.quoteValue = String.init(format: "%@", quoteValue as! CVarArg)
                            localPairs[i] = pairObject
                        }
                    }
                }
 
                handleResult = localPairs
            default:
                break
        }
        
        return handleResult
    }
}
