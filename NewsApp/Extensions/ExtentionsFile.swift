//
//  ExtentionsFile.swift
//  NewsApp
//
//  Created by Muhammad Abu Mandour on 7/5/20.
//  Copyright © 2020 iHorizons. All rights reserved.
//

import Foundation

extension String {
    var localized : String
    {
        return NSLocalizedString(self, comment: "")
    }
}
