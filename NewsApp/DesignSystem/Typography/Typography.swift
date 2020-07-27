//
//  Typography.swift
//  NewsApp
//
//  Created by MahmoudHafez on 7/27/20.
//  Copyright © 2020 iHorizons. All rights reserved.
//

import Foundation
import  UIKit

extension DesignSystem
{
    enum  Typography {
        case display1
        
        private  var fontDiscriptor: CustomFontDiscriptor
        {
            switch self {
            case .display1:
                return CustomFontDiscriptor(font: .bold, size: 14, style: .body)
            }
        }
            
            var font: UIFont{
                guard let font = UIFont(name: fontDiscriptor.font.name, size: fontDiscriptor.size)
                    else{
                    return UIFont.preferredFont(forTextStyle: fontDiscriptor.style)
                }
                
            let fontMetrics = UIFontMetrics(forTextStyle: fontDiscriptor.style)
            return fontMetrics.scaledFont(for: font)
            }
        }
}
