//
//  LocationSearchTable.swift
//  Chicago L Transit
//
//  Created by Alush Benitez on 7/29/18.
//  Copyright © 2018 Alush Benitez. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class LocationSearchTable: UITableViewController, MKLocalSearchCompleterDelegate, UISearchResultsUpdating {
    
    var mapView: MKMapView? = nil
    var matchingItems:[MKLocalSearchCompletion] = []
    
    override func viewDidLoad() {
        self.tableView.rowHeight = 60
    }

    
    func updateSearchResults(for searchController: UISearchController) {
        guard let mapView = mapView,
            let searchBarText = searchController.searchBar.text else { return }
        let request = MKLocalSearchCompleter()
        request.delegate = self
        request.queryFragment = searchBarText
        
        request.region = mapView.region
        completerDidUpdateResults(request)
    }
    
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        matchingItems = completer.results
        self.tableView.reloadData()
    }
    
    func completer(_ completer: MKLocalSearchCompleter, didFailWithError error: Error) {
        print("error")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matchingItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let searchResult = matchingItems[indexPath.row]
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        
        cell.textLabel?.text = searchResult.title + " · "
        cell.textLabel?.font = .systemFont(ofSize: 17.0, weight: UIFont.Weight(rawValue: 1))
        
        //Make address look good
        let address = searchResult.subtitle
        var key = ", IL"
        var check = 0
        var count = 0
        var countKeep = address.count
        for char in address {
            if char == key.first {
                check += 1
                if check == 4 {
                    countKeep = count - 3
                }
                key = String(key.suffix(key.count - 1))
            }
            count += 1
        }
        cell.detailTextLabel?.text = String(address.prefix(countKeep))
        
        

        return cell
    }
}

