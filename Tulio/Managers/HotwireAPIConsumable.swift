//
//  HotwireAPIConsumable.swift
//  Tulio
//
//  Created by Julio Martinez on 22/08/2017.
//  Copyright © 2017 Julio Martinez. All rights reserved.
//

import Foundation

protocol HotwireAPIConsumable {
    
    func searchCars(withSearchParams searchParams: SearchParams, completion: @escaping ([CarResult]) -> Void, onError: ((Error) -> Void)?)
    
}
