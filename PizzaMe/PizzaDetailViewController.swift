//
//  DetailViewController.swift
//  PizzaMe
//
//  Created by Soriyany keo on 6/26/16.
//  Copyright © 2016 Soriyany. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit
class PizzaDetailViewController: UIViewController{
    var restaurantViewModel:RestaurantViewModel!
    
    @IBOutlet weak var restaurantTypeLabel: UILabel!
    @IBOutlet weak var restaurantAddress: UILabel!
    @IBOutlet weak var restaurantDistanceLabel: UILabel!
    @IBOutlet weak var restaurantReviewLabel: UILabel!
    @IBOutlet weak var restaurantReviewIntroLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.title = restaurantViewModel.nameText
        restaurantTypeLabel.text = restaurantViewModel.categoryViewModel?.contentView
        restaurantAddress.text = restaurantViewModel.addressLongText
        restaurantDistanceLabel.text = restaurantViewModel.distanceText
        
        restaurantReviewLabel.text = restaurantViewModel.reviewViewModel?.reviewRateDisplayText
        restaurantReviewIntroLabel.text = restaurantViewModel.reviewViewModel?.reviewIntroDisplayText
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func actionCallBttn(sender: AnyObject) {
        if let url = NSURL(string:restaurantViewModel.phoneNumberForCallText!) {
            UIApplication.sharedApplication().openURL(url)
        }
    }
    @IBAction func actionDirectionBttn(sender: AnyObject) {
        openMapForDirection()
    }
    @IBAction func actionWebsiteBttn(sender: AnyObject) {
        openWebsiteForPizzaPlace()
    }
    func openMapForDirection() {
        let regionDistance:CLLocationDistance = 10000
        let regionSpan = MKCoordinateRegionMakeWithDistance(restaurantViewModel.location!, regionDistance, regionDistance)
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(MKCoordinate: regionSpan.center),
            MKLaunchOptionsMapSpanKey: NSValue(MKCoordinateSpan: regionSpan.span)
        ]
        let placemark = MKPlacemark(coordinate: restaurantViewModel.location!, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = restaurantViewModel.nameText
        mapItem.openInMapsWithLaunchOptions(options)
    }
    func openWebsiteForPizzaPlace() {
        if let url = NSURL(string: restaurantViewModel.businessUrl!) {
            UIApplication.sharedApplication().openURL(url)
        }
    }
}