//
//  RestaurantMock.swift
//  PizzaMe
//
//  Created by Soriyany Keo on 6/27/16.
//  Copyright © 2016 Soriyany. All rights reserved.
//


import CoreLocation
@testable import PizzaMe
class RestaurantMock {
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
    init(){
        //mapJSONToResaurantObject
        self.name = "Chuck E Cheese's"
        self.address = "7400 Ladle Ln"
        self.city = "Austin"
        self.state = "TX"
        self.distance = "0.55"
        self.phoneNumber = "(512) 282-5000"
        self.url = "https://local.yahoo.com/info-193381153-chuck-e-cheese-s-austin"
        self.clickUrl = "https://local.yahoo.com/info-193381153-chuck-e-cheese-s-austin"
        self.businessUrl = "http://www.chuckecheese.com/"
        let lat:Double = 30.22181
        let lon:Double = -97.8635
        self.location = CLLocationCoordinate2D(latitude: lat, longitude: lon)
        
//        if let reviewObject = restaurantObject.valueForKey("Rating") as? NSDictionary{
//            self.reviewViewModel = ReviewViewModel(review: Review(reviewObject: reviewObject))
//        }
//        if let categoryObject = restaurantObject.valueForKey("Categories")!.valueForKey("Category"){
//            var categoryArr:NSMutableArray = []
//            if categoryObject.valueForKey("content")![0] != nil{
//                categoryArr = categoryObject as! NSMutableArray
//            }
//            else{
//                categoryArr.addObject(categoryObject)
//            }
//            self.categoryViewModel = CategoryViewModel(categoryArr: categoryArr)
//        }
        
    }
}