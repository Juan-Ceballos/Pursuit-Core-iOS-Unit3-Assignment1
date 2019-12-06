//
//  Bundle+Extensions.swift
//  PeopleAndAppleStockPrices
//
//  Created by Juan Ceballos on 12/4/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

extension Bundle    {
    static func readRawJSONData(filename: String, ext: String) -> Data  {
        
        guard let sourceURL = Bundle.main.url(forResource: "userinfo", withExtension: "json")
            else    {
                fatalError()
        }
        
        var data: Data!
        
        do  {
            data = try Data.init(contentsOf: sourceURL)
        }
        catch   {
            fatalError()
        }
        return data
    }
}
