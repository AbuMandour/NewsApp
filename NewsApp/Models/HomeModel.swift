//
//  HomeModel.swift
//  NewsApp
//
//  Created by Muhammad Abu Mandour on 7/5/20.
//  Copyright © 2020 iHorizons. All rights reserved.
//

import Foundation
import  ObjectMapper

class HomeModel
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

    init(_ nid:String? , _ type : String?, _ perspective :String? , _ title:String?, _ fieldMedia : String?, _ entityType : String?, _ display_image :Bool? ,_ content_link : String?, _ fieldTemplate :String?,publishDate: String?) {

        self.nid=nid

        self.type=type

        self.perspective = perspective

        self.title=title

        self.fieldMedia=fieldMedia

        self.entityType = entityType

        self.display_image = display_image

        self.content_link = content_link

        self.fieldTemplate = fieldTemplate

        self.publishDate = publishDate

    }
}
