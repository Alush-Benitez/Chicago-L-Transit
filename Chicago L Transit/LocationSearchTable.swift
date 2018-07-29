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
        cell.textLabel?.text = searchResult.title
        cell.detailTextLabel?.text = searchResult.subtitle
        return cell
    }
}

