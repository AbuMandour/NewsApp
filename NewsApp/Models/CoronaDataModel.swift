//
//  CoronaDataModel.swift
//  NewsApp
//
//  Created by Muhammad Abu Mandour on 7/14/20.
//  Copyright © 2020 iHorizons. All rights reserved.
//

import Foundation

class CoronaDataModel {
    var totalCases: String?
    var totalDeath: String?
    var dateTimeNow: String?
    init(_ totalCases: String? ,_ totalDeath: String?, _ dateTimeNow: String?) {
        self.totalCases = totalCases
        self.totalDeath = totalDeath
        self.dateTimeNow = dateTimeNow
    }
}
