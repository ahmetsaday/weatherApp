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
    
    var currentWeatherModel: CurrentWeatherModel!
    var forecast: Forecast!
    var forecasts = [Forecast]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentWeatherModel = CurrentWeatherModel()
        currentWeatherModel.downloadWeatherDeatils {
            self.downloadForecastData {
                self.updateMainUI()
            }
        }
        
    }
    
    // MARK:- UITableView  Delegate and DataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecasts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as? WeatherCell{
            let forecast = forecasts[indexPath.row]
            cell.configureCell(forecast: forecast)
            return cell
        }else{
            return WeatherCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(80)
    }


    // MARK: - Data Functions
    
    func updateMainUI(){
        
        lbl_date.text = currentWeatherModel.date
        lbl_currentTemp.text = "\(currentWeatherModel.currentTemp)°"
        lbl_currentWeatherType.text = currentWeatherModel.weatherType
        lbl_location.text = currentWeatherModel.cityName
        img_currentWeather.image = UIImage(named: currentWeatherModel.weatherType)
        
    }
    
    
    func downloadForecastData(completed: @escaping DownloadComplate){
        // Downloading forecast weather data for tableview
        let forecastURL = URL(string: Forecast_URL)!
        
        Alamofire.request(forecastURL).responseJSON { response in
            
            let result = response.result
            
            if let dict = result.value as? Dictionary<String,AnyObject> {
                
                if let list = dict["list"] as? [Dictionary<String,AnyObject>] {
                    
                    for obj in list{
                        
                        let forecast = Forecast(weatherDict: obj)
                        self.forecasts.append(forecast)
                        print(obj)
                    }
                    self.forecasts.remove(at: 0)
                    self.tableView.reloadData()
                }
            }
            completed()
        }
        
    }

}






















