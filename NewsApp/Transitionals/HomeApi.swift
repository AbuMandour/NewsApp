//
//  HomeApi.swift
//  NewsApp
//
//  Created by Muhammad Abu Mandour on 7/5/20.
//  Copyright © 2020 iHorizons. All rights reserved.
//

import Foundation
import ObjectMapper

class HomeApi : Mappable
{
    var nid  : String?
    var type  : String?
    var perspective  : String?
    var entityType : String?
    var title  : String?
    var fieldMedia : String?
    var display_image : Bool?
    var content_link : String?
    var fieldTemplate : String?
    var publishDate : String?


    required init?(map: Map){
    }
    
    init(_ nid:String ,_ title:String) {
        self.nid = nid
        self.title = title
    }
    func mapping(map: Map) {
        nid <- map["nid"]
        type <- map["type"]
        perspective <- map["perspective"]
        title <- map["field_mobile_title"]
        fieldMedia <- map["field_media"]
        entityType <- map["entity_type"]
        content_link <- map["content_link"]
        display_image <- map["display_image"]
        fieldTemplate <- map["field_template"]
        publishDate <- map["field_publish_date"]

    }
}
