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
    
    func testStockData()    {
        let stock = getstockData()
        guard let stocks = stock.first else {return}
        XCTAssertGreaterThan(stock.count, 0)
        XCTAssertGreaterThan(stocks.count, 0)
    }
    
    func testStockFormat()  {
        let stock = getstockData()
        guard let stocks = stock.first else {return}
        let expectedFirstValue = 170.64
        
        XCTAssertEqual(expectedFirstValue, stocks.first?.close)
    }
    
}

extension ApplesStockInfoTests  {
    
    func getData() -> Data  {
        let data = Bundle.readRawJSONData(filename: filename, ext: ext)
        return data
    }
    
    func getstockData() -> [[Stocks]]   {
        
        let stock = Stocks.getStocks()
        return stock
    }
}
