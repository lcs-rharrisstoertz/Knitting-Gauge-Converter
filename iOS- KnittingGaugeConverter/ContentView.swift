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

    private var output: String {
        
        guard let swatchStitchWidthDouble = Double(swatchStitchWidth) else {
            return "Please provide a valid numerical value."
        }
        guard let swatchStitchLengthDouble = Double(swatchStitchLength) else {
            return "Please provide a valid numerical value."
        }
        guard let swatchLengthDouble = Double(swatchLength) else {
            return "Please provide a valid numerical value."
        }
        guard let swatchWidthDouble = Double(swatchWidth) else {
            return "Please provide a valid numerical value."
        }
        guard let finalLengthDouble = Double(finalLength) else {
            return "Please provide a valid numerical value."
        }
        guard let finalWidthDouble = Double(finalWidth) else {
            return "Please provide a valid numerical value."
        }

        let requiredWidth = getRequiredWidth(startingUnit: startingUnit, swatchWidth: swatchWidthDouble, endingUnit: endingUnit, swatchStitchWidth: swatchStitchWidthDouble, finalWidth: finalWidthDouble)
        let requiredLength = getRequiredLength(startingUnit: startingUnit, swatchLength: swatchLengthDouble, endingUnit: endingUnit, swatchStitchLength: swatchStitchLengthDouble, finalLength: finalLengthDouble)
        return "To achieve your desired dimensions, your project needs to be \(requiredWidth) stitches wide and \(requiredLength) rows long!"
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
