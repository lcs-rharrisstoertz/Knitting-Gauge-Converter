//
//  ContentView.swift
//  iOS- KnittingGaugeConverter
//
//  Created by Harris-Stoertz, Rowan on 2021-02-12.
//

import SwiftUI


struct ContentView: View {
    
    // MARK: Stored properties
    @State private var swatchStitchWidth: String = ""
    @State private var swatchStitchLength: String = ""
    @State private var swatchLength: String = ""
    @State private var swatchWidth: String = ""
    @State private var finalLength: String = ""
    @State private var finalWidth: String = ""
    @State private var startingUnit: String = ""
    @State private var endingUnit: String = ""
    
        
    // MARK: Computed properties
    
//    private var requiredWidth = getRequiredWidth(startingUnit: startingUnit, swatchWidth: Double(swatchWidth)!, endingUnit: endingUnit, swatchStitchWidth: Double(swatchStitchWidth)!, finalWidth: Double(finalWidth)!)
//    private var requiredLength = getRequiredLength(startingUnit: startingUnit, swatchLength: Double(swatchLength)!, endingUnit: endingUnit, swatchStitchLength: Double(swatchStitchLength)!, finalLength: Double(finalLength)!)
    
    private var output: String {
        return "To achieve your desired dimensions, your project needs to be requiredWidth stitches wide and requiredLength rows long!"
    }
    
    var body: some View {

        Form {
            TextField("How many stitches wide is the gauge swatch?", text: $swatchStitchWidth)
                .keyboardType(.numberPad)
            
            TextField("How many rows long is the gauge swatch?", text: $swatchStitchLength)
                .keyboardType(.numberPad)
            
            Picker("Starting unit:", selection: $startingUnit) {
                Text("inches").tag("1")
                Text("feet").tag("2")
                Text("centimeters").tag("3")
                Text("millimeters").tag("4")
            }
            .pickerStyle(SegmentedPickerStyle())
            
            TextField("How many \(startingUnit) wide is the gauge swatch?", text: $swatchWidth)
                .keyboardType(.numberPad)
            
            TextField("How many \(startingUnit) long is the gauge swatch?", text: $swatchLength)
                .keyboardType(.numberPad)
            
            Picker("Ending unit:", selection: $endingUnit) {
                Text("inches").tag("1")
                Text("feet").tag("2")
                Text("centimeters").tag("3")
                Text("millimeters").tag("4")
            }
            .pickerStyle(SegmentedPickerStyle())
            
            TextField("How many \(endingUnit) wide would you like your project to be?", text: $finalWidth)
                .keyboardType(.numberPad)
            
            TextField("How many \(endingUnit) long would you like your project to be?", text: $finalLength)
                .keyboardType(.numberPad)
            
            Text(output)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
