//
//  PairObject.swift
//  iCurrate
//
//  Created by Rost on 1/16/19.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation


struct PairObject: Codable {
    var pairId: Int
    var pairTitle: String
    var isDisable: Bool
    var quoteValue: String
}
