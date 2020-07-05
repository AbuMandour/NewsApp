//
//  HomeRepoService.swift
//  NewsApp
//
//  Created by Muhammad Abu Mandour on 7/5/20.
//  Copyright © 2020 iHorizons. All rights reserved.
//

import Foundation
import Alamofire

class HomeRepoService
{
    class func getHomeRepo(pageNum : String , completion : @escaping( _ error: Error? , _ success: Bool, _ data :[HomeApi]?)->Void)
    {
//        let URL = AppUrls.home + pageNum
//        Alamofire.request(URL).responseArray{ (response: DataResponse<[HomeApi]>) in
//            if response.error != nil
//            {
//                completion(response.error,false, response.result.value)
//            }
//            else
//            {
//                completion(response.error,true, response.result.value)
//            }
//        }
    }
    class func getMenuRepo( completion : @escaping( _ error: Error? , _ success: Bool, _ data :[MenuApi]?)->Void)
    {
//        let URL = AppUrls.menu
//        Alamofire.request(URL).responseArray{ (response: DataResponse<[MenuApi]>) in
//            if response.error != nil
//            {
//                completion(response.error,false, response.result.value)
//            }
//            else
//            {
//                completion(response.error,true, response.result.value)
//            }
//        }
    }
}
