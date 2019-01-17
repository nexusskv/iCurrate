//
//  RatesViewController+Actions.swift
//  iCurrate
//
//  Created by Rost on 1/16/19.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


extension RatesViewController {
    
    
    /// ---> switchStateDidChanged <--- ///
    @IBAction func switchStateDidChanged(_ sender: UISwitch) {
        var pairObject = dataArray[sender.tag]
        let flag = !sender.isOn
        pairObject.isDisable = flag
        dataArray[sender.tag] = pairObject
        
        PairDefaults.savePairs(dataArray)
    }
    
    
    /// ---> infoButtonTapped <--- ///
    @IBAction func infoButtonTapped(_ sender: UIButton) {
        var pairsString: String = ""
        
        var count = 0
        for pairs in self.dataArray {
            if pairs.isDisable == false {
                pairsString.append(pairs.pairTitle)
                pairsString.append(",")
            }
            
            count += 1
        }
        
        pairsString = String(pairsString.dropLast())
        
        loadQuotes(pairsString)
    }
    
    
    /// ---> showInfo <--- ///
    func showInfo() {
         self.performSegue(withIdentifier: "ShowInfo", sender: self)
    }
    
    
    /// ---> refreshPairs <--- ///
    func refreshPairs(_ pairs: [PairObject], needSave: Bool) {
        if needSave {
            PairDefaults.savePairs(pairs)
        }
        
        self.dataArray = pairs
        self.dataTable.reloadData()
    }
    
    
    /// ---> setOnlyActivePairs <--- ///
    func setOnlyActivePairs() -> [PairObject] {
        var activePairs: [PairObject] = []
        
        for pair in self.dataArray {
            if pair.isDisable == false {
                activePairs.append(pair)
            }
        }
        
        return activePairs
    }
}
