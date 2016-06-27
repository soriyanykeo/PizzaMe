//
//  GetJSONRequest.swift
//  PizzaMe
//
//  Created by Soriyany Keo on 6/23/16.
//  Copyright © 2016 Soriyany. All rights reserved.
//

import Foundation
import CoreLocation
class GetJSONRequest {
    let defaultSession = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
    var dataTask: NSURLSessionDataTask?
    let urlstring:String!
    
    init(url:String){
        self.urlstring = url
    }
    
    func getPizzaList(completionHandler: (NSArray?) -> ()) {
        if dataTask != nil {
            dataTask!.cancel()
        }
        if let encodedString = urlstring.stringByAddingPercentEncodingWithAllowedCharacters(
            NSCharacterSet.URLFragmentAllowedCharacterSet()),
            url = NSURL(string: encodedString) {
            dataTask = defaultSession.dataTaskWithURL(url) {
                data, response, error in
                if let error = error {
                    print(error.localizedDescription)
                    completionHandler(nil)
                }
                else if let httpResponse = response as? NSHTTPURLResponse {
                    if httpResponse.statusCode == 200 {
                        self.parseServerData(data!, response: response, error: error, completionHandler: { (dataDict) in
                            let arr:NSArray = dataDict!.valueForKey("query")!.valueForKey("results")!.valueForKey("Result") as! NSArray
                            var resultArr = [RestaurantViewModel]()
                            for result in arr{
                                let restaurantModel:RestaurantViewModel = RestaurantViewModel(restaurant: Restaurant(restaurantObject: result as! NSDictionary))
                                resultArr.append(restaurantModel)
                            }
                            completionHandler(resultArr)
                        })
                    }
                    else{
                        completionHandler(nil)
                        print("server error.")
                    }
                }
            }
            
            dataTask!.resume()
        }
    }
    func parseServerData(data: NSData?, response: NSURLResponse?, error: NSError?,completionHandler: (NSDictionary?) -> ()) {
        do {
            let dataDict = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as! NSDictionary
            completionHandler(dataDict)
        }
        catch{
            completionHandler(nil)
            print("Unexpected data format provided by server.")
        }
    }
}