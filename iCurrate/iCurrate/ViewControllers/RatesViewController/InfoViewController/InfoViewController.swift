//
//  InfoViewController.swift
//  iCurrate
//
//  Created by Rost on 1/16/19.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import UIKit


class InfoViewController: UIViewController {
    @IBOutlet weak var dataTable: UITableView!
    
    var dataArray: [PairObject] = []
    
    
    /// ---> View life cycle <--- ///
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataTable.tableFooterView = UIView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        dataTable.reloadData()
    }

}
