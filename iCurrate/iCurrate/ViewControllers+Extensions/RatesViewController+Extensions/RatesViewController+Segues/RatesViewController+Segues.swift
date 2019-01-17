//
//  RatesViewController+Segues.swift
//  iCurrate
//
//  Created by Rost on 1/17/19.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


extension RatesViewController {
    
    
    /// ---> Rates view controller segue <--- ///
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowInfo" {
            if let detailsVC: InfoViewController = segue.destination as? InfoViewController {
                detailsVC.dataArray = setOnlyActivePairs()
            }
        }
    }
}
