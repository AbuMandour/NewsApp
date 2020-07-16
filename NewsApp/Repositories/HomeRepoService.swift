//
//  HomeRepoService.swift
//  NewsApp
//
//  Created by Muhammad Abu Mandour on 7/5/20.
//  Copyright © 2020 iHorizons. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper


class HomeRepoService
{
    class func getHomeRepo(pageNum : String , completion : @escaping( _ error: Error? , _ success: Bool, _ data :[HomeApi]?)->Void)
    {
        let URL = AppUrls.home + pageNum
        Alamofire.request(URL).responseArray{ (response: DataResponse<[HomeApi]>) in
            if response.error != nil
            {
                completion(response.error,false, response.result.value)
            }
            else
            {
                completion(response.error,true, response.result.value)
            }
        }
    }
    class func getMenuRepo( completion : @escaping( _ error: Error? , _ success: Bool, _ data :[MenuApi]?)->Void)
    {
        let URL = AppUrls.menu
        Alamofire.request(URL).responseArray{ (response: DataResponse<[MenuApi]>) in
            if response.error != nil
            {
                completion(response.error,false, response.result.value)
            }
            else
            {
                completion(response.error,true, response.result.value)
            }
        }
    }
    class func getCoronaLiveData(completion : @escaping(_ error: Error? ,_ success: Bool, _ data: CoronaDataApi?)->Void){
        
        let url = "https://coronavirus-monitor.p.rapidapi.com/coronavirus/worldstat.php"
        
        let headers: HTTPHeaders = [
            "x-rapidapi-host": "coronavirus-monitor.p.rapidapi.com",
            "x-rapidapi-key": "c96cd16232msh87b9d62245e6a34p180e99jsn98e759c21314"
        ]
        Alamofire.request(url, headers: headers).responseObject { (response: DataResponse<CoronaDataApi>) in
            if(response.error != nil)
            {
                completion(response.error,false,nil)
            }
            else{
                completion(nil,true,response.result.value)
            }
        }
    }
}
