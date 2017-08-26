//
//  TulioTests.swift
//  TulioTests
//
//  Created by Julio Martinez on 21/08/2017.
//  Copyright © 2017 Julio Martinez. All rights reserved.
//

import XCTest
@testable import Tulio

class TulioTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testParseCars() {
        let carResultsInteractor = CarResultsInteractor(apiConsumer: HotwireAPIConsumerFakeImpl())
        carResultsInteractor.execute(withSearchParams: SearchParams(place: "fake", fromDate: Date(), untilDate: Date()), completion: { carResults in
            XCTAssert(carResults.count > 0)
        }, onError: { error in
            XCTFail("Failed with error: \(error)")
        })
    }
    
}
