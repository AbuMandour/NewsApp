//
//  CoronaDataApi.swift
//  NewsApp
//
//  Created by Muhammad Abu Mandour on 7/14/20.
//  Copyright © 2020 iHorizons. All rights reserved.
//

import Foundation
import ObjectMapper

class CoronaDataApi : Mappable {
    var total_cases : String?
    var new_cases : String?
    var total_deaths : String?
    var new_deaths : String?
    var total_recovered : String?
    var active_cases : String?
    var serious_critical : String?
    var total_cases_per_1m_population : String?
    var deaths_per_1m_population : String?
    var statistic_taken_at : String?

    required init?(map: Map) {

    }

    func mapping(map: Map) {

        total_cases <- map["total_cases"]
        new_cases <- map["new_cases"]
        total_deaths <- map["total_deaths"]
        new_deaths <- map["new_deaths"]
        total_recovered <- map["total_recovered"]
        active_cases <- map["active_cases"]
        serious_critical <- map["serious_critical"]
        total_cases_per_1m_population <- map["total_cases_per_1m_population"]
        deaths_per_1m_population <- map["deaths_per_1m_population"]
        statistic_taken_at <- map["statistic_taken_at"]
    }
}
