//
//  Colors.swift
//  NewsApp
//
//  Created by MahmoudHafez on 7/27/20.
//  Copyright © 2020 iHorizons. All rights reserved.
//
import UIKit
import Foundation

extension DesignSystem
{
    enum Colors : String {
        // Colors names
        case primary = "Primary"
        
    
        
        // Rerturn UIColor for selected value
        var color :UIColor
        {
            switch self {
            case .primary:
               return UIColor(named: self.rawValue)!
            }
        }
        
        
    }
}
