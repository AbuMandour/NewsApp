//
//  MenuModel.swift
//  NewsApp
//
//  Created by Muhammad Abu Mandour on 7/5/20.
//  Copyright © 2020 iHorizons. All rights reserved.
//

import Foundation

class MenuModel {
    var label  : String?
    var lableEnglish  : String?
    var section  : String?
    
    init(_ label:String?,_ lableEnglish:String?,_ section :String?) {
        self.label=label
        self.lableEnglish = lableEnglish
        self.section = section
    }
}
