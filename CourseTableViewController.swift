//
//  CourseTableViewController.swift
//  IT ShowCase
//
//  Created by Zumbahlen, Eric on 2/22/19.
//  Copyright © 2019 Zumbahlen, Eric. All rights reserved.
//

import UIKit


class CourseTableViewController: UITableViewController, UISearchResultsUpdating {

    let unfilteredCourses = ["115 - Reasoning About Complex Systems", "140 - Interacting In A Digital World", "150 - Using Microcomputer Productivity Tools", "164 - Introduction To Problem Solving Using The Computer", "165 - Computer Programming For Scientists", "166 - PYTHON PROGRAMMING FOR SCIENCE AND DATA ANALYSIS", "168 - Structured Problem Solving Using The Computer", "170 - Scripting Languages and Automation", "178 - Computer Application Programming", "179 - Introduction To Data Structures", "180 - C++ PROGRAMMING", "191 - Introduction To It Professional Practice", "214 - Social, Legal, And Ethical Issues In Information Technology", "225 - Computer Organization", "226 - Advanced Practical Application Development", "244 - Introduction To Business Intelligence", "250 - Fundamentals of Information Assurance and Security", "254 - Hardware And Software Concepts", "261 - Systems Development I", "262 - Information Technology Project Management", "272 - Cobol As A Second Language", "275 - Java As A Second Language", "276 - Data Communications", "279 - Algorithms And Data Structures", "287 - Independent Study", "291 - Undergraduate Teaching Experiences In Information Technology", "299 - Independent Honor Study", "326 - Principles Of Software Engineering", "327 - Concepts Of Programming Languages", "328 - Introduction To The Theory Of Computation", "330 - Introduction To Enterprise Computer Systems", "340 - Introduction To Artificial Intelligence", "341 - Object-Oriented System Development", "344 - Applied Data Mining", "345 - Advanced Business Intelligence And Data Warehousing", "351 - Practical Cryptography and Trusted Systems", "353 - Web Development Technologies", "354 - Advanced Web Application Development", "355 - Secure Software Development", "356 - Introduction To Computer Graphics", "357 - Tools And Techniques In Defensive Security", "358 - Mobile and Cloud Computing", "359 - Tools And Techniques in Penetration Testing", "360 - Security Incident And Event Management And Forensics", "363 - Systems Development II", "367 - Designing The User Interface", "368 - Topics In Information Systems", "368a10 - Web Site Development Using Asp.Net", "368a16 - Managing It Services", "368a17 - Enterprise Resource Planning", "369 - Topics In Cybersecurity", "370 - Server Management", "372 - External Data Structures", "373 - Wide Area Network Infrastructures", "374 - Topics In Telecommunications", "376 - Wireless And Mobile Network Security", "377 - Practical Telecommunication Networking", "378 - Database Processing", "379 - Advanced Computer Networks", "380 - Wireless Communication Systems", "381 - Network Design And Analysis", "382 - Distributed Systems", "383 - Principles Of Operating Systems", "385 - Topics In Computer Science", "386 - Introduction to Networking and Parallel and Distributed Computing", "388 - Introduction To Parallel Processing", "391 - Directed Project In Information Technology", "392 - Enterprise Systems Integration & Application Development", "398 - Professional Practice: In Information Technology", "398a50 - Professional Practice:Coop In Information Technology", "398a60 - Professional Practice:Coop In Information Technology", "400 - Independent Study", "426 - Advanced Software Engineering", "427 - Design and Analysis of Algorithms", "428 - Fundamental Theory of Computer Science", "429 - Compiler Design", "432 - Systems Analysis And Design", "441 - Big Data", "443 - Information Retrieval and Search Engines", "444 - Data Analytics and Mining", "450 - Policy & Administration In Information Assurance & Security", "452 - Data and Information Visualization", "463 - Information Technology Project Management", "467 - Human Factors In Information Systems", "468 - Software Quality Assurance And Testing", "477 - Converged Network Architectures", "478 - Advanced Database Management", "483 - Advanced Operating Systems", "485 - Advanced Topics In Information Systems", "485a02 - Adv Topics Systems Development:Web Site Development,.Net Tec", "488 - Topics in Computer Science", "494 - Graduate Directed Project", "495 - Information Technology Capstone", "496 - Information Technology Strategy & Policy", "497 - Introduction To Research Methodology", "498 - Professional Practice:Information Technology", "499 - Independent Research For The Master’s Thesis"].sorted()
    
    var filteredCourses: [String]?
    
    
    let searchController = UISearchController(searchResultsController: nil) // use the original tableView as the result table
    
    override func viewDidLoad() {
        filteredCourses = unfilteredCourses
        
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
        guard let courses = filteredCourses else {
            
            return 0
            
        }
        
        return courses.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "basicCell", for: indexPath)
        
        if let courses = filteredCourses{
            
            let course = courses[indexPath.row]
            
            cell.textLabel!.text = course
            
        }
        
        return cell
        
        
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        
        if let searchText = searchController.searchBar.text, !searchText.isEmpty {
            
            filteredCourses = unfilteredCourses.filter { course in
                
                return course.lowercased().contains(searchText.lowercased())
                
            }
            
        } else {
            
            filteredCourses = unfilteredCourses
            
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
