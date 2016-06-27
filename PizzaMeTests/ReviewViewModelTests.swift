//
//  ReviewViewModelTest.swift
//  PizzaMe
//
//  Created by Soriyany Keo on 6/27/16.
//  Copyright © 2016 Soriyany. All rights reserved.
//


import XCTest
@testable import PizzaMe
class ReviewViewModelTests: XCTestCase {
    var reviewWithNoRatings:Review!
    var reviewWithRatings:Review!
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let reviewWithNoRatingsObject:NSMutableDictionary = NSMutableDictionary()
        reviewWithNoRatingsObject.setValue("NaN", forKey: "AverageRating")
        reviewWithNoRatingsObject.setValue("0", forKey: "TotalRatings")
        reviewWithNoRatingsObject.setValue("0", forKey: "TotalReviews")
        reviewWithNoRatingsObject.setValue(nil, forKey: "LastReviewDate")
        reviewWithNoRatingsObject.setValue(nil, forKey: "LastReviewIntro")
        reviewWithNoRatings = Review(reviewObject: reviewWithNoRatingsObject)
        
        let reviewWithRatingsObject:NSMutableDictionary = NSMutableDictionary()
        reviewWithRatingsObject.setValue("5", forKey: "AverageRating")
        reviewWithRatingsObject.setValue("15", forKey: "TotalRatings")
        reviewWithRatingsObject.setValue("15", forKey: "TotalReviews")
        reviewWithRatingsObject.setValue("1296746913", forKey: "LastReviewDate")
        reviewWithRatingsObject.setValue("This place was great!", forKey: "LastReviewIntro")
        reviewWithRatings = Review(reviewObject: reviewWithRatingsObject)
    }
    func testLastReviewDateIsNotNil(){
        XCTAssertTrue(reviewWithRatings.lastReviewDate != nil, "LastReviewDate is not Nil")
    }
    func testLastReviewDateIsNil(){
        XCTAssertNil(reviewWithNoRatings.lastReviewDate, "LastReviewDate is Nil")
    }
    func testLastReviewIntroIsNotNil(){
        XCTAssertTrue(reviewWithRatings.lastReviewIntro != nil, "LastReviewIntro is not Nil")
    }
    func testLastReviewIntroIsNil(){
        XCTAssertNil(reviewWithNoRatings.lastReviewIntro, "LastReviewIntro is Nil")
    }
    func testTotalRatingsIsZero(){
        XCTAssertTrue(Int(reviewWithNoRatings.totalReviews!) == 0, "totalReviews is 0")
    }
    func testTotalRatingsIsNotZero(){
        XCTAssertTrue(Int(reviewWithRatings.totalReviews!) == 15, "totalReviews is 15")
    }
    func testReviewRateDisplayTextWithNoReview() {
        let reviewViewModel:ReviewViewModel = ReviewViewModel(review: reviewWithNoRatings)
        XCTAssert(reviewViewModel.reviewRateDisplayText == "No review", "no review")
        
    }
    func testReviewRateDisplayTextWithReview() {
        let reviewViewModel:ReviewViewModel = ReviewViewModel(review:reviewWithRatings)
        XCTAssert(reviewViewModel.reviewRateDisplayText == "5 stars 15 reviews.", "5 stars 15 reviews")
    }
}