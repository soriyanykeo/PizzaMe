//
//  ReviewViewModelTest.swift
//  PizzaMe
//
//  Created by Soriyany Keo on 6/27/16.
//  Copyright © 2016 Soriyany. All rights reserved.
//


import XCTest
@testable import PizzaMe
class CategoryViewModelTests: XCTestCase {
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    func testContentViewIsNotEmpty() {
        let arr = [["content":"Tapas"],["content":"Pizza"]]
        let cate:CategoryViewModel = CategoryViewModel(categoryArr: arr as NSArray)
        XCTAssertTrue(cate.contentView != "", "CategoryViewModel not empty")
    }
    func testContentViewIsEmpty() {
        let arr = []
        let cate:CategoryViewModel = CategoryViewModel(categoryArr: arr as NSArray)
        XCTAssertTrue(cate.contentView == "", "CategoryViewModel is empty")
    }
}