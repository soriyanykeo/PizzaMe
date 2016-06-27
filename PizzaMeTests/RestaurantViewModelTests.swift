//
//  RestaurantViewModelTest.swift
//  PizzaMe
//
//  Created by Soriyany keo on 6/27/16.
//  Copyright © 2016 Soriyany. All rights reserved.
//

import XCTest
@testable import PizzaMe
class RestaurantViewModelTests: XCTestCase {
    var restaurantViewModel:RestaurantViewModel!
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let restaurantObject:NSMutableDictionary = NSMutableDictionary()
        restaurantObject.setValue("Chuck E Cheese's", forKey: "Title")
        restaurantObject.setValue("7400 Ladle Ln", forKey: "Address")
        restaurantObject.setValue("Austin", forKey: "City")
        restaurantObject.setValue("TX", forKey: "State")
        restaurantObject.setValue("0.55", forKey: "Distance")
        restaurantObject.setValue("(512) 282-5000", forKey: "Phone")
        restaurantObject.setValue("https://local.yahoo.com/info-193381153-chuck-e-cheese-s-austin", forKey: "Url")
        restaurantObject.setValue("https://local.yahoo.com/info-193381153-chuck-e-cheese-s-austin", forKey: "ClickUrl")
        restaurantObject.setValue("http://www.chuckecheese.com/", forKey: "BusinessUrl")
        restaurantObject.setValue("30.22181", forKey: "Latitude")
        restaurantObject.setValue("-97.8635", forKey: "Longitude")
        restaurantObject.setValue(nil, forKey: "Rating")
        let cate:NSMutableDictionary = NSMutableDictionary()
        cate.setValue(nil, forKey: "Categories")
        restaurantObject.setValue(cate, forKey: "Categories")
        restaurantViewModel = RestaurantViewModel(restaurant: Restaurant(restaurantObject: restaurantObject))
        
    }
    func testAddressShort() {
        XCTAssertTrue(restaurantViewModel.addressShortText == "7400 Ladle Ln", "Address short is '7400 Ladle Ln'")
    }
    func testAddressLong() {
        XCTAssertTrue(restaurantViewModel.addressLongText == "7400 Ladle Ln, Austin, TX", "Address long is '7400 Ladle Ln, Austin, TX'")
    }
    func testPhoneNumberDisplayText() {
        XCTAssertTrue(restaurantViewModel.phoneNumberDisplayText == "(512) 282-5000", "phoneNumberDisplayText is (512) 282-5000")
    }
    func testPhoneNumberForCallTextWithTEL() {
        XCTAssertTrue(restaurantViewModel.phoneNumberForCallText == "tel://5122825000", "phoneNumberForCallText is tel://5122825000")
    }
    func testPhoneNumberForCallText() {
        XCTAssertTrue(restaurantViewModel.removeSpecialCharsFromPhoneNumber(restaurantViewModel.phoneNumberForCallText!) == "5122825000", "phoneNumberForCallText is 5122825000")
    }
    func testDistanceWithMi() {
        XCTAssertTrue(restaurantViewModel.distanceText == "0.55 mi", "Distance is '0.55 mi'")
    }
}