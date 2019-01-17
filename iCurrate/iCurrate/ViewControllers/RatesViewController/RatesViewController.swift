//
//  RatesViewController.swift
//  iCurrate
//
//  Created by Rost on 1/16/19.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import UIKit

class RatesViewController: UIViewController {
    @IBOutlet weak var dataTable: UITableView!
    
    var dataArray: [PairObject] = []

    
    /// ---> View life cycle <--- ///
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadPairs()
        
        self.dataTable.tableFooterView = UIView()
    }

}

