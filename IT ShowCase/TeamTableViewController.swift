//
//  TeamTableViewController.swift
//  TableViewController101
//
//  Created by Zumbahlen, Eric on 2/6/19.
//  Copyright © 2019 Zumbahlen, Eric. All rights reserved.
//

import UIKit

class TeamTableViewController: UITableViewController, UISearchResultsUpdating {
    
    
    let unfilteredNFLTeams = ["Bengals", "Ravens", "Browns", "Steelers", "Bears", "Lions", "Packers", "Vikings",
                              
                              "Texans", "Colts", "Jaguars", "Titans", "Falcons", "Panthers", "Saints", "Buccaneers",
                              
                              "Bills", "Dolphins", "Patriots", "Jets", "Cowboys", "Giants", "Eagles", "Redskins",
                              
                              "Broncos", "Chiefs", "Raiders", "Chargers", "Cardinals", "Rams", "49ers", "Seahawks"].sorted()
    
    var filteredNFLTeams: [String]?
    
    
    let searchController = UISearchController(searchResultsController: nil) // use the original tableView as the result table

    override func viewDidLoad() {
        filteredNFLTeams = unfilteredNFLTeams
        
        searchController.searchResultsUpdater = self
        
        searchController.hidesNavigationBarDuringPresentation = false
        
        searchController.dimsBackgroundDuringPresentation = false
        
        tableView.tableHeaderView = searchController.searchBar
        
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let nflTeams = filteredNFLTeams else {
            
            return 0
            
        }
        
        return nflTeams.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "basicCell", for: indexPath)
        
        if let nflTeams = filteredNFLTeams {
            
            let team = nflTeams[indexPath.row]
            
            cell.textLabel!.text = team
            
        }
        
        return cell
        

    }
    
    func updateSearchResults(for searchController: UISearchController) {
        
        if let searchText = searchController.searchBar.text, !searchText.isEmpty {
            
            filteredNFLTeams = unfilteredNFLTeams.filter { team in
                
                return team.lowercased().contains(searchText.lowercased())
                
            }
            
        } else {
            
            filteredNFLTeams = unfilteredNFLTeams
            
        }
        
        tableView.reloadData()
        
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
