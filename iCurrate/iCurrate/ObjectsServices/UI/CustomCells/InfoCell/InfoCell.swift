//
//  InfoCell.swift
//  iCurrate
//
//  Created by Rost on 1/16/19.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


class InfoCell: UITableViewCell {
    @IBOutlet weak var pairsLabel: UILabel!
    @IBOutlet weak var qouteLabel: UILabel!
    
    
    /// ---> setCellValues <--- ///
    func setCellValues(_ sender: PairObject) {
        pairsLabel.text = sender.pairTitle
        qouteLabel.text = sender.quoteValue
    }
}
