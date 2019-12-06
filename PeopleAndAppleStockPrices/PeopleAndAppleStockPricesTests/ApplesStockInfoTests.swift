//
//  ApplesStockInfoTests.swift
//  PeopleAndAppleStockPricesTests
//
//  Created by Juan Ceballos on 12/5/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import XCTest
@testable import PeopleAndAppleStockPrices

class ApplesStockInfoTests: XCTestCase {
    
    let filename = "applstockinfo"
    let ext = "json"
    
    func testRawStockData() {
        let data = getData()
        
        XCTAssertNotNil(data)
    }
    
}

extension ApplesStockInfoTests  {
    
    func getData() -> Data  {
        let data = Bundle.readRawJSONData(filename: filename, ext: ext)
        return data
    }
}
