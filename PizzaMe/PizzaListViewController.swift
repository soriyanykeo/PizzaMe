//
//  ViewController.swift
//  PizzaMe
//
//  Created by Soriyany Keo on 6/23/16.
//  Copyright © 2016 Soriyany. All rights reserved.
//

import UIKit
import CoreLocation
class PizzaListViewController: UIViewController,UITabBarDelegate,UITableViewDataSource,CLLocationManagerDelegate {
    var data:NSArray?
    var dataCount:Int = 0
    var manager:CLLocationManager!
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestAlwaysAuthorization()
        manager.startUpdatingLocation()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataCount
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        let res:RestaurantViewModel = data![indexPath.row] as! RestaurantViewModel
        let restaurantName:UILabel = cell.viewWithTag(100) as! UILabel
        restaurantName.text = res.nameText
        
        let restaurantAddress:UILabel = cell.viewWithTag(101) as! UILabel
        restaurantAddress.text = res.addressShortText
        
        let restaurantCityState:UILabel = cell.viewWithTag(102) as! UILabel
        restaurantCityState.text = res.citystateText
        
        let restaurantDistance:UILabel = cell.viewWithTag(103) as! UILabel
        restaurantDistance.text = res.distanceText
        
        let restaurantPhone:UILabel = cell.viewWithTag(104) as! UILabel
        restaurantPhone.text = res.phoneNumberDisplayText
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let pizzaDetailVC:PizzaDetailViewController =  storyboard.instantiateViewControllerWithIdentifier("PizzaDetailVC") as! PizzaDetailViewController
        pizzaDetailVC.restaurantViewModel = data![indexPath.row] as! RestaurantViewModel
        self.navigationController?.pushViewController(pizzaDetailVC, animated: true)
    }
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        manager.stopUpdatingLocation()
        let lat: Double = (locations.last?.coordinate.latitude)!
        let latitude : String = String(format:"%f", lat)
        let lon: Double = (locations.last?.coordinate.longitude)!
        let longitude : String = String(format:"%f", lon)
        
        let url:String = REQUESTURL + "q=select * from local.search where latitude='\(latitude)' and longitude='\(longitude)' and query='pizza' | sort(field='Distance')&format=json&diagnostics=true&callback="
        
        let getJson:GetJSONRequest = GetJSONRequest(url: url)
        getJson.getPizzaList { (results) in
            if results != nil{
                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
                    self.dataCount = results!.count
                    self.data = results
                    dispatch_async(dispatch_get_main_queue()) {
                        self.tableview.reloadData()
                    }
                }
            }
        }
    }
}

