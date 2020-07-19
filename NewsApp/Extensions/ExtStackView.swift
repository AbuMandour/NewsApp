//
//  ExtStackView.swift
//  NewsApp
//
//  Created by MahmoudHafez on 7/19/20.
//  Copyright © 2020 iHorizons. All rights reserved.
//

import Foundation
import UIKit
extension UIStackView {
    func customize(backgroundColor: UIColor = .clear, radiusSize: CGFloat = 0) {
        let subView = UIView(frame: bounds)
        subView.backgroundColor = backgroundColor
        subView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        insertSubview(subView, at: 0)
        subView.layer.cornerRadius = radiusSize
        subView.layer.masksToBounds = true
        subView.clipsToBounds = true
    }
}
