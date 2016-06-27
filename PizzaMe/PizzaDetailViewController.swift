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
    var res:RestaurantViewModel!
    
    @IBOutlet weak var restaurantReviewLabel: UILabel!
    @IBOutlet weak var restaurantTypeLabel: UILabel!
    
    @IBOutlet weak var restaurantAddress: UILabel!
    @IBOutlet weak var restaurantCityStateLabel: UILabel!
    
    @IBOutlet weak var restaurantDistanceLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.title = res.nameText
        restaurantReviewLabel.text = res.reviewViewModel?.reviewRateDisplayText
        restaurantCityStateLabel.text = res.reviewViewModel?.reviewIntroDisplayText
        restaurantTypeLabel.text = res.categoryViewModel?.contentView
        
        restaurantAddress.text = res.addressLongText
        restaurantDistanceLabel.text = res.distanceText
        
        print(res.categoryViewModel?.contentView)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func actionCallBttn(sender: AnyObject) {
        if let url = NSURL(string:"tel://5124330984") {
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
        let regionSpan = MKCoordinateRegionMakeWithDistance(res.location!, regionDistance, regionDistance)
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(MKCoordinate: regionSpan.center),
            MKLaunchOptionsMapSpanKey: NSValue(MKCoordinateSpan: regionSpan.span)
        ]
        let placemark = MKPlacemark(coordinate: res.location!, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = res.nameText
        mapItem.openInMapsWithLaunchOptions(options)
    }
    func openWebsiteForPizzaPlace() {
        if let url = NSURL(string: res.businessUrl!) {
            UIApplication.sharedApplication().openURL(url)
        }
    }
}