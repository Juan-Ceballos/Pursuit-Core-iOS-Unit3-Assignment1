//
//  DetailedAppleStockController.swift
//  PeopleAndAppleStockPrices
//
//  Created by Juan Ceballos on 12/7/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class DetailedAppleStockController: UIViewController {

    @IBOutlet weak var stockResultImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var openStockLabel: UILabel!
    @IBOutlet weak var closeStockLabel: UILabel!
    
    var stocks: Stocks?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        guard let stock = stocks
            else    {
                fatalError()
        }
        
        if stock.open > stock.close {
            view.backgroundColor = .red
            stockResultImageView.image = #imageLiteral(resourceName: "thumbsDown")
        }
        else    {
            view.backgroundColor = .green
            stockResultImageView.image = #imageLiteral(resourceName: "thumbsUp")
        }
        
        
        dateLabel.text = stock.date
        openStockLabel.text = "Open: \(stock.open.description)"
        closeStockLabel.text = "Close: \(stock.close.description)"
    }

}
