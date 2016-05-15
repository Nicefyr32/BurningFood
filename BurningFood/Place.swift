//
//  Place.swift
//  BurningFood
//
//  Created by Thomas Rasmussen on 13/05/2016.
//  Copyright © 2016 Thomas Rasmussen. All rights reserved.
//

import Foundation

import MapKit

class Place: NSObject, MKAnnotation {
    let title: String?
    let subtitle: String?
    var coordinate: CLLocationCoordinate2D // WTF?
    
    init(title:String, subtitle:String, coordinate: CLLocationCoordinate2D){
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
    }
}