//
//  Tests_iOS.swift
//  Tests iOS
//
//  Created by Tcheng, James (BJH) on 13/01/2022.
//

import XCTest

class Tests_iOS: XCTestCase {

    func testNewCarGivesMeACarWithAllAttributesSet() {
        let car = Car(make: "Mazda", model: "MX-5", topSpeed: 125, acceleration: 7.7, handling: 5)
        XCTAssertEqual(car.make, "Mazda")
        XCTAssertEqual(car.model, "MX-5")
        XCTAssertEqual(car.topSpeed, 125)
        XCTAssertEqual(car.acceleration, 7.7)
        XCTAssertEqual(car.handling, 5)
    }
    
    func testDisplayStatsMethodGivesMeAllAttributesCorrectly(){
        let car = Car(make: "Mazda", model: "MX-5", topSpeed: 125, acceleration: 7.7, handling: 5)

        let stats = car.displayStats()
        XCTAssertEqual(stats, "Make: Mazda\nModel: MX-5\nTop Speed: 125mph\nAcceleration (0-60): 7.7s\nHandling: 5")
    }
}
