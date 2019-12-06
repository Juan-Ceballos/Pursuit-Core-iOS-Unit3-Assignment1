//
//  AppleStockData.swift
//  PeopleAndAppleStockPrices
//
//  Created by Juan Ceballos on 12/5/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct Stocks: Decodable    {
    let date: String
    let open: Double
    let label: String
    
    let month = ["01": "January", "02": "February", "03": "March", "04": "April", "05": "May", "06": "June", "07": "July", "08": "August", "09": "September", "10": "October", "11": "November", "12": "December"]
}

extension Stocks    {
    
    static func getStocks() -> [[Stocks]]   {
        var stocks = [Stocks]()
        var sectionsArr = [[Stocks]]()
        //empty array of stocks
        //first get path
        
        guard let sourceURL = Bundle.main.url(forResource: "applstockinfo", withExtension: "json")
            else    {
                fatalError()
        }
        
        // then create data using the path to reosurce
        do  {
            //create data using source
            let data = try Data(contentsOf: sourceURL)
            let stock = try JSONDecoder().decode([Stocks].self, from: data)
            
            stocks = stock//.sorted {$0.label < $1.label}
            // now populate stocks with Stock object
            let dateTitle: Set<String> = Set(stocks.map {$0.label})
            sectionsArr = Array(repeating: [Stocks](), count: dateTitle.count)
            
            var currentIndex = 0
            var currentLabel = stocks.first?.date ?? ""
            var currentLabelArray = currentLabel.components(separatedBy: "-")
            
            // nned to distinguis labels month and year
            
            for element in stocks {
                let arrayOfDates = element.date.components(separatedBy: "-")
                if arrayOfDates[0] == currentLabelArray[0] && arrayOfDates[1] == currentLabelArray[1]   {
                    sectionsArr[currentIndex].append(element)
                }
                else    {
                    currentIndex += 1
                    currentLabel = element.date
                    currentLabelArray = currentLabel.components(separatedBy: "-")
                    sectionsArr[currentIndex].append(element)
                }
            }
            
        }
        catch   {
            fatalError()
        }
        return sectionsArr
    }
}
