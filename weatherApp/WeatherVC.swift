//
//  ViewController.swift
//  weatherApp
//
//  Created by AhmetSADAY on 6.06.2017.
//  Copyright © 2017 ahmetsaday. All rights reserved.
//

import UIKit
import Alamofire

class WeatherVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var lbl_date: UILabel!
    @IBOutlet weak var lbl_currentTemp: UILabel!
    @IBOutlet weak var lbl_location: UILabel!
    @IBOutlet weak var img_currentWeather: UIImageView!
    @IBOutlet weak var lbl_currentWeatherType: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(CURRENT_WEATHER_URL)
    }
    
    // MARK:- UITableView  Delegate and DataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(80)
    }



}

