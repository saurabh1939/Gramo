//
//  LocationViewController.swift
//  Jam Clan
//
//  Created by Saurabh singh rathore on 28/04/17.
//  Copyright © 2017 Saurabh singh rathore. All rights reserved.
//

import UIKit

class LocationViewController: UIViewController {

    @IBOutlet var tableLocation:UITableView!
    
    @IBOutlet var searchBarLocation:UISearchBar!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.registerNib()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: USER DEFINED METHODS
    func registerNib()
    {
        let nibName = UINib(nibName: "LocationTableViewCell", bundle:nil)
        tableLocation.register(nibName, forCellReuseIdentifier: "Cell")
    }
    
    
    @IBAction func buttonBackClicked()
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    // MARK: UITableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    // cell height
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableLocation.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! LocationTableViewCell
        cell.selectionStyle=UITableViewCellSelectionStyle.none
        return cell
    }
    
    
    // Search Bar Delegate :
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar)
    {
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar)
    {
        searchBar.text = ""
        searchBar.showsCancelButton = false
        
        searchBar.resignFirstResponder()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        searchBar.resignFirstResponder()
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        
        
    }

}
