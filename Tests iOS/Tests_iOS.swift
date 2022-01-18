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
    
    func testWhenBoughtEngineAndBrakesPackageOtherTwoUpgradesAreDisabled() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.switches["Engine Package ($800)"]/*[[".cells[\"Engine Package ($800)\"].switches[\"Engine Package ($800)\"]",".switches[\"Engine Package ($800)\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.switches["Brakes Package ($200)"]/*[[".cells[\"Brakes Package ($200)\"].switches[\"Brakes Package ($200)\"]",".switches[\"Brakes Package ($200)\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCTAssertEqual(tablesQuery/*@START_MENU_TOKEN@*/.switches["Exhaust Package ($400)"]/*[[".cells[\"Exhaust Package ($400)\"].switches[\"Exhaust Package ($400)\"]",".switches[\"Exhaust Package ($400)\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.isEnabled, false)
        XCTAssertEqual(tablesQuery/*@START_MENU_TOKEN@*/.switches["Tires Package ($400)"]/*[[".cells[\"Tires Package ($400)\"].switches[\"Tires Package ($400)\"]",".switches[\"Tires Package ($400)\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.isEnabled, false)
            
    }
    
    func testWhenBoughtExhaustPackageFundsDeductedBy400() throws{
        let app = XCUIApplication()
        app.launch()
        
        let tablesQuery = app.tables
        tablesQuery.switches["Exhaust Package ($400)"].tap()
        
        XCTAssertEqual(app/*@START_MENU_TOKEN@*/.staticTexts["Available Funds: $600"]/*[[".cells[\"Available Funds: $600\"].staticTexts[\"Available Funds: $600\"]",".staticTexts[\"Available Funds: $600\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.exists, true)
        
    }
    
    func testCanSellEngineAndBrakesWhenNoMoneyLeft() throws{
        let app = XCUIApplication()
        app.launch()
        //test
        
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.switches["Engine Package ($800)"]/*[[".cells[\"Engine Package ($800)\"].switches[\"Engine Package ($800)\"]",".switches[\"Engine Package ($800)\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery.switches["Brakes Package ($200)"].tap()
        XCTAssertEqual(tablesQuery/*@START_MENU_TOKEN@*/.switches["Engine Package ($800)"]/*[[".cells[\"Engine Package ($800)\"].switches[\"Engine Package ($800)\"]",".switches[\"Engine Package ($800)\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.isEnabled, true)
        XCTAssertEqual(tablesQuery.switches["Brakes Package ($200)"].isEnabled, true)
    }
    
    func testNextCarResetsFundsAndChangesCar() throws{
        
        let app = XCUIApplication()
        app.launch()
        
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.switches["Tires Package ($400)"]/*[[".cells[\"Tires Package ($400)\"].switches[\"Tires Package ($400)\"]",".switches[\"Tires Package ($400)\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Make: Mazda\nModel: MX-5\nTop Speed: 125mph\nAcceleration (0-60): 7.7s\nHandling: 7"]/*[[".cells[\"Make: Mazda\\nModel: MX-5\\nTop Speed: 125mph\\nAcceleration (0-60): 7.7s\\nHandling: 7, Next Car\"].staticTexts[\"Make: Mazda\\nModel: MX-5\\nTop Speed: 125mph\\nAcceleration (0-60): 7.7s\\nHandling: 7\"]",".staticTexts[\"Make: Mazda\\nModel: MX-5\\nTop Speed: 125mph\\nAcceleration (0-60): 7.7s\\nHandling: 7\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        XCTAssertEqual(app.staticTexts["Make: Volkswagen\nModel: Golf\nTop Speed: 110mph\nAcceleration (0-60): 6.9s\nHandling: 7"].exists ,true)
        XCTAssertEqual(app.staticTexts["Available Funds: $1,000"].exists, true)
        }
}
