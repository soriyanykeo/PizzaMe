//
//  Review.swift
//  PizzaMe
//
//  Created by Soriyany keo on 6/26/16.
//  Copyright © 2016 Soriyany. All rights reserved.
//

import Foundation
class Review{
    var averageRating:String?
    var totalRatings:String?
    var totalReviews:String?
    var lastReviewDate:String?
    var lastReviewIntro:String?
    
    
    init(reviewObject:NSDictionary){
        //mapJSONToReViewObject
        self.averageRating = reviewObject.valueForKey("AverageRating") as? String
        self.totalRatings = reviewObject.valueForKey("TotalRatings") as? String
        self.totalReviews = reviewObject.valueForKey("TotalReviews") as? String
        self.lastReviewDate = reviewObject.valueForKey("LastReviewDate") as? String
        self.lastReviewIntro = reviewObject.valueForKey("LastReviewIntro") as? String
    }
}