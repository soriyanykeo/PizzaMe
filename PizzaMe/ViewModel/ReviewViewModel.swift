//
//  ReviewViewModel.swift
//  PizzaMe
//
//  Created by Soriyany Keo on 6/27/16.
//  Copyright © 2016 Soriyany. All rights reserved.
//

import Foundation
class ReviewViewModel{
    var reviewRateDisplayText:String = "No review"
    var reviewIntroDisplayText:String = ""
    
    init(review:Review){
        if Int(review.totalReviews!) > 0 {
            self.reviewRateDisplayText = (review.averageRating)! + " stars " + (review.totalReviews)! + " reviews."
            if ((review.lastReviewIntro?.isEmpty) != nil && (review.lastReviewDate?.isEmpty) != nil) {
                let dayTimePeriodFormatter = NSDateFormatter()
                dayTimePeriodFormatter.dateFormat = "EEEE MMMM d, yyyy"
                let dateString = dayTimePeriodFormatter.stringFromDate(NSDate(timeIntervalSince1970: Double(review.lastReviewDate!)!))
                reviewIntroDisplayText = dateString + ":\n" + review.lastReviewIntro!
            }
        }
    }
}