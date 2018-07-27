//
//  LStation.swift
//  Chicago L Transit
//
//  Created by Alush Benitez on 7/26/18.
//  Copyright © 2018 Alush Benitez. All rights reserved.
//

import Foundation
import MapKit

class LStation {
    var name: String?
    var stopName: String?
    var accessible: Bool?
    var red: Bool?
    var blue: Bool?
    var green: Bool?
    var brown: Bool?
    var purple: Bool?
    var purpleEx: Bool?
    var yellow: Bool?
    var pink: Bool?
    var orange: Bool?
    var lines: [Bool]
    var coordinate: CLLocationCoordinate2D
    
    init(name: String, stopName: String, accessible: Bool, red: Bool, blue: Bool, green: Bool, brown: Bool, purple: Bool, purpleEx: Bool, yellow: Bool, pink: Bool, orange: Bool, lines: [Bool], coordinate: CLLocationCoordinate2D) {
        self.name = name
        self.stopName = stopName
        self.accessible = accessible
        self.red = red
        self.blue = blue
        self.green = green
        self.brown = brown
        self.purple = purple
        self.purpleEx = purpleEx
        self.yellow = yellow
        self.pink = pink
        self.orange = orange
        self.coordinate = coordinate
        self.lines = lines
    }

//    override init() {
//        self.name = ""
//        self.stopName = ""
//        self.accessible = false
//        self.red = false
//        self.blue = false
//        self.green = false
//        self.brown = false
//        self.purple = false
//        self.purpleEx = false
//        self.yellow = false
//        self.pink = false
//        self.orange = false
//        self.coordinate = CLLocationCoordinate2D()
//        self.lines = [Bool]()
//    }
    
    
}
