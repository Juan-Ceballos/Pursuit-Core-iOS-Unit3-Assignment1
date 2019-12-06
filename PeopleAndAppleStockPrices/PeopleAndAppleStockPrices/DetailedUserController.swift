//
//  DetailedUserController.swift
//  PeopleAndAppleStockPrices
//
//  Created by Juan Ceballos on 12/5/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class DetailedUserController: UIViewController {

    @IBOutlet weak var defaultImage: UIImageView!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var cellLabel: UILabel!
    
    var users: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
       
        guard let user = users else {
            return
        }
        
        defaultImage.image = #imageLiteral(resourceName: "profileImage")
        genderLabel.text = "Gender: \(user.gender.capitalized)"
        emailLabel.text = "Email: \(user.email)"
        cellLabel.text = "Cell: \(user.cell)"
    }
}
