//
//  InstrumentsViewController.swift
//  Jam Clan
//
//  Created by Saurabh singh rathore on 27/04/17.
//  Copyright © 2017 Saurabh singh rathore. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage


class InstrumentsViewController: UIViewController {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    
    @IBOutlet var tableInstruments:UITableView!
    
    @IBOutlet var searchBarInstruments:UISearchBar!

    var arrayInstruments : NSMutableArray!
    var arraySelectedItems : NSMutableArray!




    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.arrayInstruments = []

        self.registerNib()

        ApiGetInstruments()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //MARK: USER DEFINED METHODS
    func registerNib()
    {
        let nibName = UINib(nibName: "InstrumentsTableViewCell", bundle:nil)
        tableInstruments.register(nibName, forCellReuseIdentifier: "Cell")
    }
    
    
    @IBAction func buttonBackClicked()
    {
    self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func buttonDoneClicked()
    {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "getInstruments"), object: arraySelectedItems)
        self.navigationController?.popViewController(animated: true)

    }

    
    
    // MARK: UITableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.arrayInstruments.count>0
        {
            return self.arrayInstruments.count

        }
        return 0
    }
    
    // cell height
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableInstruments.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! InstrumentsTableViewCell
        
        cell.labelName.text=(self.arrayInstruments[indexPath.row] as? NSDictionary )?.value(forKey: "englishName") as? String
        cell.imageInstruments.sd_setImage(with: URL(string: ((self.arrayInstruments[indexPath.row] as? NSDictionary )?.value(forKey: "photos") as? String)!), placeholderImage: UIImage(named: "placeholder.png"))
        cell.buttonCheck.isSelected=false
        if (arraySelectedItems.value(forKey: "_id") as AnyObject).contains((self.arrayInstruments[indexPath.row] as? NSDictionary )?.value(forKey: "_id") as? String as Any) {
            cell.buttonCheck.isSelected=true
        }
        
        cell.selectionStyle=UITableViewCellSelectionStyle.none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath)
    {
        if (arraySelectedItems.value(forKey: "_id") as AnyObject).contains((self.arrayInstruments[indexPath.row] as? NSDictionary )?.value(forKey: "_id") as? String as Any)
        {
            let index = (arraySelectedItems.value(forKey: "_id") as AnyObject).index(of: (self.arrayInstruments[indexPath.row] as? NSDictionary )?.value(forKey: "_id") as? String as Any)
            arraySelectedItems.removeObject(at: index)

        }
        else
        {
        arraySelectedItems.add(self.arrayInstruments[indexPath.row] as? NSDictionary as Any )
        }
        
        tableInstruments.reloadData()
        
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
    
    func ApiGetInstruments()
    {
        self.appDelegate.showHud(title: "Loading...", sender: self.view)
        
        let urlString = "/api/servicelist"
        
        //   name=AyushBansal,email=ayush%40wemo.in,password=123456,phone=8860368057,location=Delhi,deviceType=iOS,lat=22.45,long=78.33,appVersion=1,deviceToken=sdsfeerfeggfergegergr,deviceModel=Samsung,deviceVersion=23
        
        let requestParam:Parameters = [
            "type":"instruments",
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
                        self.arrayInstruments.addObjects(from: arrayTemp as! [Any])

                        self.tableInstruments.reloadData()
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
