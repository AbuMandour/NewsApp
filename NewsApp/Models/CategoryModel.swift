//
//  Category.swift
//  NewsApp
//
//  Created by Muhammad Abu Mandour on 7/15/20.
//  Copyright © 2020 iHorizons. All rights reserved.
//

import Foundation

class CategoryModel : Favoritable{
    func addToFavoirte() -> Bool {        
        //realm.add(self)
        return false
    }
    
    
    var opened: Bool
    var title: String
    var items: [String]
    init(_ title: String , _ items: [String], _ opened: Bool) {
        self.title = title
        self.items = items
        self.opened = opened
    }
}
