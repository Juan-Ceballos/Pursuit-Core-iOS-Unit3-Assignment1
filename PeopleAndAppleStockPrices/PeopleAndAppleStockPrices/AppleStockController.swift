//
//  AppleStockController.swift
//  PeopleAndAppleStockPrices
//
//  Created by Juan Ceballos on 12/5/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class AppleStockController: UIViewController {

    @IBOutlet weak var stockTableView: UITableView!
    
    var stocks = [[Stocks]]() {
        didSet  {
            stockTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        stockTableView.dataSource = self
    }
    
    func loadData() {
        stocks = Stocks.getStocks()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailedAppleStockController = segue.destination as? DetailedAppleStockController, let indexPath = stockTableView.indexPathForSelectedRow
            else    {
                fatalError()
        }
        let stock = stocks[indexPath.section][indexPath.row]
        detailedAppleStockController.stocks = stock
    }
    
}

extension AppleStockController: UITableViewDataSource   {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(stocks[section].count)
        return stocks[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let stockCell = stockTableView.dequeueReusableCell(withIdentifier: "stockCell", for: indexPath)
           
        //stockcell set up
        //now need user instance
        let stock = stocks[indexPath.section][indexPath.row]
        
        stockCell.textLabel?.text = stock.date
        stockCell.detailTextLabel?.text = stock.open.description
        
        return stockCell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return stocks.first?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let fullDate = stocks[section].first?.date ?? "default"
        //let fullDate = stocks[section].
        print(fullDate)
        let arrayOfFullDate = fullDate.components(separatedBy: "-")
        
        print(arrayOfFullDate)
        
        var sum = 0.0
        let denominator = stocks[section].count
        for element in stocks[section] {
            sum += element.open
        }
        
        let average = sum/Double(denominator)
        
        return "\(stocks[section].first?.month[arrayOfFullDate[1]] ?? "") - \(arrayOfFullDate[0]), Average:  $\(String(format: "%.2f", average))"
    }
}

