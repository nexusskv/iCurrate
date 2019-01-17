//
//  RatesCell.swift
//  iCurrate
//
//  Created by Rost on 1/16/19.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


class RatesCell: UITableViewCell {
    @IBOutlet weak var pairsLabel: UILabel!
    @IBOutlet weak var infoSwitch: UISwitch!
    
    
    /// ---> setCellValues <--- ///
    func setCellValues(_ sender: PairObject) {
        pairsLabel.text = sender.pairTitle
        
        infoSwitch.isOn = !sender.isDisable
        infoSwitch.tag  = sender.pairId
    }
}
