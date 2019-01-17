//
//  RatesViewController+ApiConnector.swift
//  iCurrate
//
//  Created by Rost on 1/17/19.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


extension RatesViewController {
    
    
    /// ---> loadPairs <--- ///
    func loadPairs() {
        let localPairs = PairDefaults.getPairs()
        
        if localPairs.count == 0 {
            let requestLink = LinkBuilder.buildLink(RequestTypes.Currencies.rawValue, params: "")
            
            ApiConnector.loadData(requestLink,
                                  type: RequestTypes.Currencies.rawValue,
                                  completion: { [weak self] (result) in
                guard let strongSelf = self else { return }

                DispatchQueue.main.async {
                    strongSelf.refreshPairs(result as! [PairObject], needSave: true)
                }
            })
        } else {
            refreshPairs(localPairs, needSave: false)
        }
    }
    
    
    /// ---> loadQuotes <--- ///
    func loadQuotes(_ pairs: String) {
        let requestLink = LinkBuilder.buildLink(RequestTypes.Quotes.rawValue, params: pairs)
        
        ApiConnector.loadData(requestLink,
                              type: RequestTypes.Quotes.rawValue,
                              completion: { [weak self] (result) in
                                guard let strongSelf = self else { return }

                                DispatchQueue.main.async {
                                    strongSelf.refreshPairs(result as! [PairObject], needSave: true)
                                    strongSelf.showInfo()
                                }
        })
    }
}
