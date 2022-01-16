//
//  ContentView.swift
//  Shared
//
//  Created by Tcheng, James (BJH) on 13/01/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var starterCars = StarterCars()
    @State private var selectedCar: Int = 0 {
        didSet {
            if selectedCar >= starterCars.cars.count {
                selectedCar = 0
            }
        }
    }
    @State private var exhaustPackage = false
    @State private var tiresPackage = false
    @State private var enginePackage = false
    @State private var brakesPackage = false
    @State private var remainingFunds = 1000
    
    func resetDisplay(){
        remainingFunds = 1000
        exhaustPackage = false
        tiresPackage = false
        enginePackage = false
        brakesPackage = false
        starterCars = StarterCars()
        
    }
    
    func exhaustPackageEnabled()->Bool{
        return remainingFunds >= 400 || exhaustPackage
    }
    func tiresPackageEnabled()->Bool{
        return remainingFunds >= 400 || tiresPackage
    }
    func enginePackageEnabled()->Bool{
        return remainingFunds >= 800 || enginePackage
    }
    func brakesPackageEnabled()->Bool{
        return remainingFunds >= 200 || brakesPackage
    }
    
    
        var body: some View {
            let exhaustPackageBinding = Binding<Bool> (
                get: {self.exhaustPackage},
                set: {newValue in
                    self.exhaustPackage = newValue
                    if newValue == true{
                        starterCars.cars[selectedCar].topSpeed += 5
                        remainingFunds -= 400
                    } else {
                        starterCars.cars[selectedCar].topSpeed -= 5
                        remainingFunds += 400
                    }
                    
                }
            )
            let tiresPackageBinding = Binding<Bool> (
                get: {self.tiresPackage},
                set: {newValue in
                    self.tiresPackage = newValue
                    if newValue == true{
                        starterCars.cars[selectedCar].handling += 2
                        remainingFunds -= 400
                    } else {
                        starterCars.cars[selectedCar].handling -= 2
                        remainingFunds += 400
                    }
                    
                }
            )
            
            let enginePackageBinding = Binding<Bool> (
                get: {self.enginePackage},
                set: {newValue in
                    self.enginePackage = newValue
                    if newValue == true{
                        starterCars.cars[selectedCar].topSpeed += 10
                        starterCars.cars[selectedCar].acceleration = (starterCars.cars[selectedCar].acceleration * 10 - 3) / 10
                        remainingFunds -= 800
                    } else {
                        starterCars.cars[selectedCar].topSpeed -= 10
                        starterCars.cars[selectedCar].acceleration = (starterCars.cars[selectedCar].acceleration * 10 + 3) / 10
                        remainingFunds += 800
                    }
                    
                }
            )
            
            let brakesPackageBinding = Binding<Bool> (
                get: {self.brakesPackage},
                set: {newValue in
                    self.brakesPackage = newValue
                    if newValue == true{
                        starterCars.cars[selectedCar].handling += 1
                        remainingFunds -= 200
                    } else {
                        starterCars.cars[selectedCar].handling -= 1
                        remainingFunds += 200
                    }
                    
                }
            )
            
            
            Form{
                VStack(alignment: .leading, spacing: 20){
                    Text(starterCars.cars[selectedCar].displayStats())
                    Button("Next Car", action: {
                        selectedCar += 1
                        self.resetDisplay()
                    })
                }
                Section{
                    Toggle("Exhaust Package ($400)", isOn: exhaustPackageBinding)
                        .disabled(!exhaustPackageEnabled())
                    Toggle("Tires Package ($400)", isOn: tiresPackageBinding)
                        .disabled(!tiresPackageEnabled())
                    Toggle("Engine Package ($800)", isOn: enginePackageBinding)
                        .disabled(!enginePackageEnabled())
                    Toggle("Brakes Package ($200)", isOn: brakesPackageBinding)
                        .disabled(!brakesPackageEnabled())
                }
                Section{
                    Text("Available Funds: $\(remainingFunds)")
                }
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
