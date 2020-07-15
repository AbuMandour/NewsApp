//
//  BaseService.swift
//  NewsApp
//
//  Created by Muhammad Abu Mandour on 7/15/20.
//  Copyright © 2020 iHorizons. All rights reserved.
//

import Foundation

public class BaseService{
    
    class func getDateNow() -> String{
        let date = Date()
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return df.string(from: date)
    }
}
