//
//  UserProfiles.swift
//  PeopleAndAppleStockPrices
//
//  Created by Juan Ceballos on 12/4/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct UserProfiles: Decodable  {
    let results: [User]
}

struct User: Decodable  {
    let gender: String
    let name: nameWrapper
    let location: locationWrapper
    let email: String
    let cell: String
}

struct nameWrapper: Decodable   {
    let title: String
    let first: String
    let last: String
    var fullName: String  {
        "\(first) \(last)"
    }
}

struct locationWrapper: Decodable   {
    let street: String
    let city: String
    let state: String
    let postcode: String
}

extension UserProfiles  {
    static func getUsers() -> [User]    {
        var users = [User]()
        
        guard let sourceURL = Bundle.main.url(forResource: "userinfo", withExtension: "json")
            else    {
                fatalError("sourceURL, raw data")
        }
        
        do  {
            let data = try Data.init(contentsOf: sourceURL)
            let userProfiles = try JSONDecoder().decode(UserProfiles.self, from: data)
            users = userProfiles.results.sorted {$0.name.first < $1.name.first}
        }
        catch   {
            fatalError()
        }
        
        return users
    }
}
