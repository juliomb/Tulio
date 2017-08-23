//
//  CarResultsInteractor.swift
//  Tulio
//
//  Created by Julio Martinez on 22/08/2017.
//  Copyright © 2017 Julio Martinez. All rights reserved.
//

import Foundation

class CarResultsInteractor {
    
    let manager: HotwireAPIManager
    let searchParams: SearchParams
    
    init(searchParams: SearchParams, manager: HotwireAPIManager = HotwireAPIManagerFakeImpl()) {
        self.searchParams = searchParams
        self.manager = manager
    }
    
    func execute(completion: @escaping ([CarResult]) -> Void, onError: ((Error) -> Void)? = nil) {
        manager.searchCars(withSearchParams: searchParams, completion: { carResults in
            assert(Thread.current == Thread.main)
            completion(carResults)
        }) { error in
            if let onError = onError {
                onError(error)
            }
        }
    }
    
}
