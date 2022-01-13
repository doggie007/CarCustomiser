//
//  ContentView.swift
//  Shared
//
//  Created by Tcheng, James (BJH) on 13/01/2022.
//

import SwiftUI

struct ContentView: View {
    let car = Car(make: "Mazda", model: "MX-5", topSpeed: 125, acceleration: 7.7, handling: 5)
    func displayStats(car: Car)->String{
        var stats: String
        stats = ""
        stats += "Make: \(car.make)"
        stats += "\n"
        stats += "Model: \(car.model)"
        stats += "\n"
        stats += "Top Speed: \(car.topSpeed)mph"
        stats += "\n"
        stats += "Acceleration (0-60): \(car.acceleration)s"
        stats += "\n"
        stats += "Handling: \(car.handling)"
        return stats
    }
    var body: some View {
        Text(displayStats(car: car))
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
