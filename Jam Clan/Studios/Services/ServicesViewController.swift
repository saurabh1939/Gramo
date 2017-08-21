//
//  ServicesViewController.swift
//  Jam Clan
//
//  Created by Saurabh singh rathore on 27/04/17.
//  Copyright © 2017 Saurabh singh rathore. All rights reserved.
//

import UIKit
import Alamofire


class ServicesViewController: UIViewController {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    
    @IBOutlet var tableServices:UITableView!
    
    @IBOutlet var searchBarServices:UISearchBar!
    
    var arrayItems : NSMutableArray!
    var arraySelectedItems : NSMutableArray!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.arrayItems = []
        
        self.registerNib()
        ApiGetSkills()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //MARK: USER DEFINED METHODS
    func registerNib()
    {
        let nibName = UINib(nibName: "ServicesTableViewCell", bundle:nil)
        tableServices.register(nibName, forCellReuseIdentifier: "Cell")
    }

    
    @IBAction func buttonBackClicked()
    {
        self.navigationController?.popViewController(animated: true)

    }
    
    @IBAction func buttonDoneClicked()
    {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "getSkills"), object: arraySelectedItems)
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func buttonSelectAllClicked()
    {
    arraySelectedItems.removeAllObjects()
    arraySelectedItems.addObjects(from: (arrayItems!) as! [Any])
        tableServices.reloadData()
    }
    
    
    
    // MARK: UITableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.arrayItems.count>0
        {
            return self.arrayItems.count
            
        }
        return 0
    }
    
    // cell height
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableServices.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ServicesTableViewCell
        cell.labelName.text=(self.arrayItems[indexPath.row] as? NSDictionary )?.value(forKey: "englishName") as? String
        cell.buttonCheck.isSelected=false
        if (arraySelectedItems.value(forKey: "_id") as AnyObject).contains((self.arrayItems[indexPath.row] as? NSDictionary )?.value(forKey: "_id") as? String as Any) {
            cell.buttonCheck.isSelected=true
        }
        
        cell.selectionStyle=UITableViewCellSelectionStyle.none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath)
    {
        if (arraySelectedItems.value(forKey: "_id") as AnyObject).contains((self.arrayItems[indexPath.row] as? NSDictionary )?.value(forKey: "_id") as? String as Any)
        {
            let index = (arraySelectedItems.value(forKey: "_id") as AnyObject).index(of: (self.arrayItems[indexPath.row] as? NSDictionary )?.value(forKey: "_id") as? String as Any)
            arraySelectedItems.removeObject(at: index)
            
        }
        else
        {
            arraySelectedItems.add(self.arrayItems[indexPath.row] as? NSDictionary as Any )
        }
        
        tableServices.reloadData()
        
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
    
    
    func ApiGetSkills()
    {
        self.appDelegate.showHud(title: "Loading...", sender: self.view)
        
        let urlString = "/api/servicelist"
        
        //   name=AyushBansal,email=ayush%40wemo.in,password=123456,phone=8860368057,location=Delhi,deviceType=iOS,lat=22.45,long=78.33,appVersion=1,deviceToken=sdsfeerfeggfergegergr,deviceModel=Samsung,deviceVersion=23
        
        let requestParam:Parameters = [
            "type":"skills",
            "deviceType":kConstant.Constants.via,
            
        ]
        let headers: HTTPHeaders = HttpApiModel().header()
        print("\(requestParam)")
        Alamofire.request(kConstant.Constants.kBaseURL.appending(urlString), method: .post, parameters: requestParam, encoding:URLEncoding.default, headers: headers).responseJSON { (response:DataResponse<Any>) in
            //  print("\(response)")
            switch(response.result) {
            case .success(_):
                if response.response?.statusCode==200
                {
                    
                    let dict = response.result.value as! NSDictionary
                    var theJSONText:String! = ""
                    
                    do {
                        let jsonData = try? JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
                        // here "jsonData" is the dictionary encoded in JSON data
                        
                        theJSONText = NSString(data: jsonData!,
                                               encoding: String.Encoding.ascii.rawValue) as String!
                    }
                    
                    print(theJSONText)
                    
                    
                    let arrayTemp = dict.object(forKey: "response") as! NSArray
                    
                    if arrayTemp.count > 0
                    {
                        self.arrayItems.addObjects(from: arrayTemp as! [Any])
                        
                        self.tableServices.reloadData()
                    }
                    
                    
                    //    let result = dict.object(forKey: "response") as! NSDictionary
                    
                    
                    self.appDelegate.hideHud()
                    
                    
                }
                else
                {
                    self.appDelegate.hideHud()
                    
                    self.appDelegate.showAlert(Title: response.result.value as? String ?? "errorMsg")
                }
                break
            case .failure(_):
                self.appDelegate.hideHud()
                
                print(response.result.error ?? "Response")
                
                break
                
            }
            
        }
    }
    
    
}
