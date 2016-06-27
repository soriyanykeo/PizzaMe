//
//  CategoryViewModel.swift
//  PizzaMe
//
//  Created by Soriyany keo on 6/26/16.
//  Copyright © 2016 Soriyany. All rights reserved.
//

import Foundation
class CategoryViewModel{
    var contentView:String = ""
    init(categoryArr:NSArray){
        for category in categoryArr {
            if contentView.isEmpty {
                contentView = category.valueForKey("content") as! String
            }
            else{
                contentView = contentView + ", " + (category.valueForKey("content") as! String)
            }
        }
    }
}