//
//  Car.swift
//  CarCustomiser
//
//  Created by Tcheng, James (BJH) on 13/01/2022.
//

import Foundation

struct Car{
    let make: String
    let model: String
    var topSpeed: Int
    var acceleration: Double
    var handling: Int
    
    func displayStats()->String{
        var stats: String
        stats = ""
        stats += "Make: \(make)"
        stats += "\n"
        stats += "Model: \(model)"
        stats += "\n"
        stats += "Top Speed: \(topSpeed)mph"
        stats += "\n"
        stats += "Acceleration (0-60): \(acceleration)s"
        stats += "\n"
        stats += "Handling: \(handling)"
        return stats
    }
}
