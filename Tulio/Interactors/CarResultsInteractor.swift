//
//  CarResultsInteractor.swift
//  Tulio
//
//  Created by Julio Martinez on 22/08/2017.
//  Copyright © 2017 Julio Martinez. All rights reserved.
//

import Foundation

class CarResultsInteractor {
    
    let apiConsumer: HotwireAPIConsumable
    
    init(apiConsumer: HotwireAPIConsumable = HotwireAPIConsumerURLSessionImpl()) {
        self.apiConsumer = apiConsumer
    }
    
    func execute(with searchParams: SearchParams, completion: @escaping ([CarResult]) -> Void, onError: ((Error) -> Void)? = nil) {
        apiConsumer.searchCars(withSearchParams: searchParams, completion: { carResults in
            assert(Thread.current == Thread.main)
            completion(carResults)
        }) { error in
            if let onError = onError {
                assert(Thread.current == Thread.main)
                onError(error)
            }
        }
    }
    
}
