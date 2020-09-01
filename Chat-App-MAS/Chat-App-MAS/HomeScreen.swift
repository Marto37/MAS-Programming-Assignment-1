//
//  HomeScreen.swift
//  Chat-App-MAS
//
//  Created by Marcelo Costa on 9/1/20.
//  Copyright © 2020 Malek Amiri. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import CoreLocation

class HomeScreen: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    var temp: Double = 0.0
    var weather = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        var locManager = CLLocationManager()
        locManager.requestWhenInUseAuthorization()
        
        var currentLocation: CLLocation!

        if
           CLLocationManager.authorizationStatus() == .authorizedWhenInUse ||
           CLLocationManager.authorizationStatus() ==  .authorizedAlways
        {
            currentLocation = locManager.location
            
            AF.request("https://api.openweathermap.org/data/2.5/weather?lat=\(Int(currentLocation.coordinate.latitude))&lon=\(Int(currentLocation.coordinate.longitude))&appid=9c9be18e946884ad4490023ab22774d7").responseJSON { (response) in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    self.temp = json["main"]["temp"].double ?? 0.0
                    self.weather = json["weather"]["description"].string ?? "No info"
                    
                case .failure(let error):
                    print("Weather fetching failed")
                    print(error.errorDescription)
                }
            }
        }
        
    }
    
    @IBAction func goWasPressed(_ sender: Any) {
        let name = nameTextField.text
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ViewController") as? ViewController
        if let vc = vc {
            vc.name = name ?? ""
            vc.temp = temp
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
