//
//  InfoViewController+Table.swift
//  iCurrate
//
//  Created by Rost on 1/17/19.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


extension InfoViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    /// ---> Table view data source methods <--- ///
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InfoCell", for: indexPath) as? InfoCell
        
        var pairObject: PairObject = self.dataArray[indexPath.row]
        pairObject.pairId = indexPath.row
        
        cell?.setCellValues(pairObject)
        
        return cell ?? InfoCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0
    }
}
