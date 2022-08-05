//
//  API.extension.swift
//  weatherApp
//
//  Created by Anshul Rokade on 22/07/22.
//

import Foundation

extension API{
    static let BaseURLstring = "https://openweathermap.org/data/2.5/"
    
    static func getURLFor(lat: Double, lon: Double) -> String {
        return "https://api.openweathermap.org/data/2.5/onecall?lat=\(lat)&lon=\(lon)&exclude=minutely&appid=b368610d93af1a46a6417242a18bb943"
    }
}
