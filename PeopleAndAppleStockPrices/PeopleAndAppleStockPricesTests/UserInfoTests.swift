//
//  PeopleAndAppleStockPricesTests.swift
//  PeopleAndAppleStockPricesTests
//
//  Created by Juan Ceballos on 12/4/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import XCTest
@testable import PeopleAndAppleStockPrices

class UserInfoTests: XCTestCase {

    let filename = "userinfo"
    let ext = "json"
    
    func testRawUserData()  {
        let data = getRawData()
        XCTAssertNotNil(data)
    }
    
    func testUserData() {
        let users = getUsers()
        
        XCTAssertGreaterThan(users.count, 0)
    }
    
    func testUserDataFormatted()    {
        let users = getUsers()
        //let expectedFirstUser = "eugene.henry@example.com"
        let expectedFirstAlphabeticalUser = "abbie.kelly@example.com"
        
        XCTAssertEqual(expectedFirstAlphabeticalUser, users.first?.email)
    }
}

extension UserInfoTests {
    func getRawData() -> Data  {

        let data = Bundle.readRawJSONData(filename: filename, ext: ext)
        return data

    }
    
    func getUsers() -> [User]    {
        let user = UserProfiles.getUsers()
        return user
    }
}
