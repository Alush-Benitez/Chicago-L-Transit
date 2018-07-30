//
//  ViewController.swift
//  Chicago L Transit
//
//  Created by Alush Benitez on 7/26/18.
//  Copyright © 2018 Alush Benitez. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate, UITabBarDelegate {
    

    @IBOutlet weak var mapView: MKMapView!
    
    //Tab Buttons
    @IBOutlet weak var stationsTabButton: UITabBarItem!
    @IBOutlet weak var mapTabButton: UITabBarItem!
    @IBOutlet weak var favoritesTabButton: UITabBarItem!
    @IBOutlet weak var tabBar: TabBar!
    
    
    let locationManager = CLLocationManager()
    var resultSearchController:UISearchController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Sets tab bar stuff
        tabBar.alpha = 0.96
        tabBar.selectedItem = mapTabButton
        tabBar.delegate = self
        
        
        //Add user location
        locationManager.requestWhenInUseAuthorization()
        mapView.showsUserLocation = true
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
        mapView.delegate = self
        
        //Set up search bar
        let locationSearchTable = storyboard!.instantiateViewController(withIdentifier: "LocationSearchTable") as! LocationSearchTable
        resultSearchController = UISearchController(searchResultsController: locationSearchTable)
        resultSearchController?.searchResultsUpdater = locationSearchTable
        let searchBar = resultSearchController!.searchBar
        searchBar.sizeToFit()
        searchBar.placeholder = "Search for places"
        navigationItem.titleView = resultSearchController?.searchBar
        resultSearchController?.hidesNavigationBarDuringPresentation = false
        resultSearchController?.dimsBackgroundDuringPresentation = true
        definesPresentationContext = true
        locationSearchTable.mapView = mapView
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    //Zoom in to User's current location
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            let span = MKCoordinateSpanMake(0.05, 0.05)
            let region = MKCoordinateRegion(center: location.coordinate, span: span)
            mapView.setRegion(region, animated: true)
        }
    }
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print("asjndflkadf")
        print(item)
        print(stationsTabButton)
        if item == stationsTabButton {
            performSegue(withIdentifier: "ShowSearchViewController", sender: nil)
        } else if item == mapTabButton {
            performSegue(withIdentifier: "ShowMainViewController", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("ha")
    }
}

