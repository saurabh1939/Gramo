
//
//  HttpApiModel.swift
//  Jam Clan
//
//  Created by Saurabh singh rathore on 26/07/17.
//  Copyright © 2017 Saurabh singh rathore. All rights reserved.
//

import UIKit
import Alamofire

class HttpApiModel: NSObject {
    
    var urlString: String = ""
    var parameters: NSDictionary = [:]
    
    func postPathJsonApiWithJsonParameters(urlStr: String, rBody: NSData, completion: @escaping ( _ result: NSDictionary) -> ())
    {
        let url = NSURL(string: urlStr)
        let requestUrl: NSMutableURLRequest = NSMutableURLRequest (url: url as! URL)
        requestUrl.httpMethod = "POST"
        
        let username = "user"
        let password = "password"
        let loginString = String(format: "%@:%@", username, password)
        let loginData = loginString.data(using: String.Encoding.utf8)!
        let base64LoginString = loginData.base64EncodedString()
        requestUrl.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
        
        requestUrl.httpBody = rBody as Data
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: requestUrl as URLRequest) {
            (data, response, error) in
            guard let responseData = data else {
                print("Error: did not receive data")
                return
            }
            guard error == nil else {
                print("error calling POST on /todos/1")
                print(error)
                return
            }
            
            // parse the result as JSON, since that's what the API provi
            do {
                guard let receivedTodo = try JSONSerialization.jsonObject(with: responseData,
                                                                          options: []) as? [String: AnyObject] else {
                                                                            print("Could not get JSON from responseData as dictionary")
                                                                            return
                }
                
                let dictionary = try JSONSerialization.jsonObject(with: responseData, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                
                let result = dictionary["Result"]
                print("Response Success: \(result)")
                completion(dictionary)
                //                print("The todo is: " + receivedTodo.description)
                //
                //                guard let todoID = receivedTodo["id"] as? Int else {
                //                    print("Could not get todoID as int from JSON")
                //                    return
                //                }
                //                print("The ID is: \(todoID)")
            } catch  {
                print("error parsing response from POST on /todos")
                return
            }
        }
        task.resume()
        
        
        
    }
    
    func getJsonFromObject(object : NSDictionary) -> NSData
    {
        var jsonTodo: NSData = NSData()
        do
        {
            jsonTodo = try JSONSerialization.data(withJSONObject: object, options: []) as NSData
        }
        catch
        {
            print("Error: cannot create JSON from todo")
        }
        return jsonTodo;
        
    }
    func header() -> HTTPHeaders
    {
        let headers: HTTPHeaders = [
           //"Authorization": "Basic \(base64LoginString)",
            "Content-Type": "application/x-www-form-urlencoded"
        ]
        return headers
    }

    

}
