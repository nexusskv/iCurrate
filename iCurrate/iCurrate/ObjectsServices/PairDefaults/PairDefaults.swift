//
//  PairDefaults.swift
//  iCurrate
//
//  Created by Rost on 1/17/19.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation


class PairDefaults {
    
    
    /// ---> Save Pairs to user defaults <--- ///
    static func savePairs(_ pairs: [PairObject]) {
        UserDefaults.standard.set(try? PropertyListEncoder().encode(pairs), forKey:"pairs")
        UserDefaults.standard.synchronize()
    }
    
    
    /// ---> Get Pairs from user defaults <--- ///
    static func getPairs() -> Array<PairObject> {
        if let data = UserDefaults.standard.value(forKey:"pairs") as? Data {
            if let pairsArray = try? PropertyListDecoder().decode(Array<PairObject>.self, from: data) {
                return pairsArray
            }
        }
        
        return []
    }
}
