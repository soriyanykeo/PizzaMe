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
    
    func getScheduleList(completionHandler: (NSArray?) -> ()) {
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
                        do {
                            let list = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as! NSDictionary
                            let arr:NSArray = list.valueForKey("query")!.valueForKey("results")!.valueForKey("Result") as! NSArray
                            var resultArr = [RestaurantViewModel]()
                            for result in arr{
                                let restaurantModel:RestaurantViewModel = RestaurantViewModel(restaurant: Restaurant(restaurantObject: result as! NSDictionary))
                                resultArr.append(restaurantModel)
                            }
                            completionHandler(resultArr)
                        }
                        catch{
                            completionHandler(nil)
                        }
                    }
                    else{
                        completionHandler(nil)
                    }
                }
            }
            
            dataTask!.resume()
        }
    }
    
}