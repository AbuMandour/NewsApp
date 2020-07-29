//
//  CoronaService.swift
//  NewsApp
//
//  Created by Muhammad Abu Mandour on 7/28/20.
//  Copyright © 2020 iHorizons. All rights reserved.
//

import Foundation
import RxSwift
import RxAlamofire
import RxCocoa

class CoronaService : BaseService{
        
    private(set) var  coronaDataPublisher = PublishSubject<CoronaDataModel>()
    let disposeBag = DisposeBag()
    override init() {
        super.init()
        fetchCoronaLiveData()
    }
    func fetchCoronaLiveData(){
        Observable<Int>.interval(.seconds(1), scheduler: MainScheduler.instance)
            .flatMapLatest { _ in
                requestData(.get, "https://coronavirus-monitor.p.rapidapi.com/coronavirus/worldstat.php",headers:[
                    "x-rapidapi-host": "coronavirus-monitor.p.rapidapi.com",
                    "x-rapidapi-key": "c96cd16232msh87b9d62245e6a34p180e99jsn98e759c21314"
                ]) // get data from the server.
                    .catchError { _ in .empty() }   // don't let error escape.
            }
            .map { $0.1 }
            .map { try? JSONDecoder().decode(CoronaDataApi.self, from: $0) }
            .filter { $0 != nil }
            .map { coronaDataApi in
                let coronaDataModel: CoronaDataModel = CoronaDataModel(coronaDataApi?.total_cases,coronaDataApi?.total_deaths,BaseService.getDateNow())
                return coronaDataModel
            }
            .bind(to: coronaDataPublisher)
            .disposed(by: disposeBag)
    }
}
