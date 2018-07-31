//
//  SearchViewController.swift
//  Chicago L Transit
//
//  Created by Alush Benitez on 7/26/18.
//  Copyright © 2018 Alush Benitez. All rights reserved.
//

import UIKit
import MapKit

struct CellData {
    let name: String?
    let lineColorImage: UIImage?
    let distance: String?
}



class SearchViewController: UITableViewController {
    
    var stationsCellData = [CellData]()
    var stations = [LStation]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.grabData()
        
        
        //Sets up table View
        self.tableView.register(CustomCell.self, forCellReuseIdentifier: "custom")
        self.tableView.rowHeight = 85
        self.tableView.allowsSelection = false
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    
    // ***********************************************************
    // GO THROUGH JSON DATA AND ADD ALL STATIONS TO STATIONS ARRAY
    // ***********************************************************
    func grabData() {
        let query = "https://data.cityofchicago.org/resource/8mj8-j3c4.json"
        if let url = URL(string: query) {
            if let data = try? Data(contentsOf: url) {
                let json = try! JSON(data: data)
                self.parse(json: json)
            }
        }
    }
    
    func parse(json: JSON?){
        var count = 0
        for result in json![].arrayValue {
            if count % 2 == 0 {
                var lines = [Bool]()
            
                var name = result["station_name"].stringValue
                let stopName = result["stop_name"].stringValue
                let accessible = result["ada"].boolValue
                
                if name == "Harold Washington Library-State/Van Buren" {
                    name = "State/Van Buren"
                }
            
                let red = result["red"].boolValue
                lines.append(red)
                let blue = result["blue"].boolValue
                lines.append(blue)
                let green = result["g"].boolValue
                lines.append(green)
                let brown = result["brn"].boolValue
                lines.append(brown)
                let purple = result["p"].boolValue
                lines.append(purple)
                let purpleExp = result["pexp"].boolValue
                lines.append(purpleExp)
                let yellow = result["y"].boolValue
                lines.append(yellow)
                let pink = result["pnk"].boolValue
                lines.append(pink)
                let orange = result["o"].boolValue
                lines.append(orange)
                
                
                
                let coordinate = CLLocationCoordinate2DMake(((result["location"])["coordinates"])[0].doubleValue, ((result["location"])["coordinates"])[1].doubleValue)
                
                
                let station = (LStation(name: name, stopName: stopName, accessible: accessible, red: red, blue: blue, green: green, brown: brown, purple: purple, purpleEx: purpleExp, yellow: yellow, pink: pink, orange: orange, lines: lines, coordinate: coordinate))
            
                stations.append(station)
            
                stationsCellData.append(CellData.init(name: name, lineColorImage: #imageLiteral(resourceName: "Flag_of_Chicago"), distance: "10.6 mi"))
            }
            count += 1
        }
        
    }
//
//    func reorderSationsByDistance(stations: [LStation]) -> [CellData] {
//        var closestStation = stations.first
//        for station in stations {
//            if closerThanCurrentClosest(currentClosest: closestStation, checkingStation: station){
//
//            }
//        }
//    }
//
//    func closerThanCurrentClosest(currentClosest: LStation, checkingStation: LStation) -> Bool {
//
//    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // ***********************
    // SET UP TABLE VIEW CELLS
    // ***********************
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stationsCellData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "custom") as! CustomCell

        cell.colorLineImage = stationsCellData[indexPath.row].lineColorImage
        cell.name = stationsCellData[indexPath.row].name

        cell.layoutSubviews()
        return cell
    }
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
