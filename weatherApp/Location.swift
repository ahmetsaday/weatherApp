//
//  Location.swift
//  weatherApp
//
//  Created by Banu on 9.06.2017.
//  Copyright © 2017 ahmetsaday. All rights reserved.
//

import CoreLocation

class Location {
    
    static var shareInstance = Location()
    
    private init(){}
    
    var latitude: Double!
    var longitude: Double!
}
