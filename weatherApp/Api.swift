//
//  Api.swift
//  weatherApp
//
//  Created by SADAY on 6.06.2017.
//  Copyright © 2017 ahmetsaday. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGİTUDE = "&lon="
let APP_IDE = "&appid="
let API_KEY = "f067cd16326de083146b42002effa017"

typealias DownloadComplate = () -> ()

let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)41.015137\(LONGİTUDE)28.979530\(APP_IDE)\(API_KEY)"

