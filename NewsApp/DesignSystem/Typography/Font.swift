//
//  Font.swift
//  NewsApp
//
//  Created by MahmoudHafez on 7/27/20.
//  Copyright © 2020 iHorizons. All rights reserved.
//

import Foundation
import  UIKit


enum Font: String {
    case regular  = "AvenirNext-Regular"
    case bold  = "AvenirNext-Bold"
    var name : String
    {
        return self.rawValue
    }
}
