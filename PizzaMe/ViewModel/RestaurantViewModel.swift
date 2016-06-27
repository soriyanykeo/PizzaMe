//
//  RestaurantViewModel.swift
//  PizzaMe
//
//  Created by Soriyany keo on 6/27/16.
//  Copyright © 2016 Soriyany. All rights reserved.
//

import Foundation
import CoreLocation

class RestaurantViewModel{
    var nameText:String?
    var addressShortText:String?
    var addressLongText:String?
    var citystateText:String?
    var distanceText:String?
    var phoneNumberDisplayText:String?
    var phoneNumberForCallText:String?
    var location:CLLocationCoordinate2D?
    var url:String?
    var clickUrl:String?
    var businessUrl:String?
    var reviewViewModel:ReviewViewModel?
    var categoryViewModel:CategoryViewModel?
    
    init(restaurant:Restaurant){
        self.nameText = restaurant.name
        self.addressShortText = restaurant.address
        self.addressLongText = restaurant.address! + ", " + restaurant.city! + ", " + restaurant.state!
        self.citystateText = restaurant.city! + ", " + restaurant.state!
        self.distanceText = restaurant.distance! + " mi"
        self.phoneNumberDisplayText = restaurant.phoneNumber
        self.phoneNumberForCallText = "tel://" + removeSpecialCharsFromPhoneNumber(restaurant.phoneNumber!)
        self.location = restaurant.location
        self.url = restaurant.url
        self.clickUrl = restaurant.clickUrl
        self.businessUrl = restaurant.businessUrl
        self.reviewViewModel = restaurant.reviewViewModel
        self.categoryViewModel = restaurant.categoryViewModel
    }
    func removeSpecialCharsFromPhoneNumber(text: String) -> String {
        let okayChars : Set<Character> =
            Set("1234567890".characters)
        return String(text.characters.filter {okayChars.contains($0) })
    }
}