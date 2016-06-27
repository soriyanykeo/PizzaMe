//
//  Restaurant.swift
//  PizzaMe
//
//  Created by Soriyany Keo on 6/23/16.
//  Copyright © 2016 Soriyany. All rights reserved.
//

import Foundation
import CoreLocation


class Restaurant {
    var name:String?
    var address:String?
    var city:String?
    var state:String?
    var distance:String?
    var phoneNumber:String?
    var location:CLLocationCoordinate2D?
    var url:String?
    var clickUrl:String?
    var businessUrl:String?
    var reviewViewModel:ReviewViewModel?
    var categoryViewModel:CategoryViewModel?
    init(restaurantObject:NSDictionary){
        //mapJSONToResaurantObject
        self.name = restaurantObject.valueForKey("Title") as? String
        self.address = restaurantObject.valueForKey("Address") as? String
        self.city = restaurantObject.valueForKey("City") as? String
        self.state = restaurantObject.valueForKey("State") as? String
        self.distance = restaurantObject.valueForKey("Distance") as? String
        self.phoneNumber = restaurantObject.valueForKey("Phone") as? String
        self.url = restaurantObject.valueForKey("Url") as? String
        self.clickUrl = restaurantObject.valueForKey("ClickUrl") as? String
        self.businessUrl = restaurantObject.valueForKey("BusinessUrl") as? String
        let lat:Double = (restaurantObject.valueForKey("Latitude"))!.doubleValue
        let lon:Double = (restaurantObject.valueForKey("Longitude"))!.doubleValue
        self.location = CLLocationCoordinate2D(latitude: lat, longitude: lon)
        
        if let reviewObject = restaurantObject.valueForKey("Rating") as? NSDictionary{
            self.reviewViewModel = ReviewViewModel(review: Review(reviewObject: reviewObject))
        }
        if let categoryObject = restaurantObject.valueForKey("Categories")!.valueForKey("Category"){
            var categoryArr:NSMutableArray = []
            if categoryObject.valueForKey("content")![0] != nil{
                categoryArr = categoryObject as! NSMutableArray
            }
            else{
                categoryArr.addObject(categoryObject)
            }
            self.categoryViewModel = CategoryViewModel(categoryArr: categoryArr)
        }

    }
}