//
//  UsersViewController.swift
//  PeopleAndAppleStockPrices
//
//  Created by Juan Ceballos on 12/5/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class UsersViewController: UIViewController {

    @IBOutlet weak var userTableView: UITableView!
    @IBOutlet weak var userSearchBar: UISearchBar!
    
    var users = [User]()    {
        didSet  {
            userTableView.reloadData()
        }
    }
    
    var searchQuery = ""    {
        didSet  {
            users = UserProfiles.getUsers().filter  {$0.name.fullName.contains(searchQuery.lowercased())}
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userTableView.dataSource = self
        loadData()
        userSearchBar.delegate = self
    }
    
    func loadData() {
        users = UserProfiles.getUsers()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailedUserController = segue.destination as? DetailedUserController, let indexPath = userTableView.indexPathForSelectedRow
            else    {
                fatalError()
        }
        
        let user = users[indexPath.row]
        detailedUserController.users = user
    }
    
    
}

extension UsersViewController: UITableViewDataSource    {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //make the cell
        let userCell = userTableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)
        
        //get stuff for the cell properties
        let user = users[indexPath.row]
        
        userCell.textLabel?.text = "\(user.name.first.capitalized) \(user.name.last.capitalized)"
        userCell.detailTextLabel?.text = user.location.city
        
        return userCell
    }
}

extension UsersViewController: UISearchBarDelegate   {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        userSearchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else{
            loadData()
            return
        }
        searchQuery = searchText
    }
    
}
