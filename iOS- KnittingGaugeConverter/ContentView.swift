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
        
        //guard let statements make sure that the user has entered numerical values in all fields
        //if not, they are told to enter a different value
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
//once the user has entered proper numerical values, functions are called to calculate the number of stitches needed for their project
        let requiredWidth = getRequiredWidth(startingUnit: startingUnit, swatchWidth: swatchWidthDouble, endingUnit: endingUnit, swatchStitchWidth: swatchStitchWidthDouble, finalWidth: finalWidthDouble)
        let requiredLength = getRequiredLength(startingUnit: startingUnit, swatchLength: swatchLengthDouble, endingUnit: endingUnit, swatchStitchLength: swatchStitchLengthDouble, finalLength: finalLengthDouble)
            //the program returns the number of stitches needed
        return "To achieve your desired dimensions, your project needs to be \(requiredWidth) stitches wide and \(requiredLength) rows long!"
    }
    
    var body: some View {
        NavigationView{
        Form {
            List{
            NavigationLink(destination: HowToUse()){
                Text("Instructions")
            }
            }//link to instructions on how to make the gauge swatch
            //MARK: Input
            Section(header: Text("Gauge Swatch Stitch Count")) {//this section gets the number of stitches in the gauge swatch
            TextField("Number of stitches wide", text: $swatchStitchWidth)
                .keyboardType(.numberPad)
            
            TextField("Number of rows long", text: $swatchStitchLength)
                .keyboardType(.numberPad)
            }
            Section(header: Text("Gauge Swatch measurements")) {//this section gets the measurements and units of the gauge swatch
            Picker("Starting unit:", selection: $startingUnit) {
                Text("inches").tag("1")
                Text("feet").tag("2")
                Text("centimeters").tag("3")
                Text("millimeters").tag("4")
            }
            .pickerStyle(SegmentedPickerStyle())
            
            TextField("Width", text: $swatchWidth)
                .keyboardType(.numberPad)
            
            TextField("Length", text: $swatchLength)
                .keyboardType(.numberPad)
            }
            Section(header: Text("Desired final measurements")) {//this section gets the measurements for how big the user wants their completed knitting to be
            Picker("Ending unit:", selection: $endingUnit) {
                Text("inches").tag("1")
                Text("feet").tag("2")
                Text("centimeters").tag("3")
                Text("millimeters").tag("4")
            }
            .pickerStyle(SegmentedPickerStyle())
            
            TextField("Desired width", text: $finalWidth)
                .keyboardType(.numberPad)
            
            TextField("Desired length", text: $finalLength)
                .keyboardType(.numberPad)
            }
            //MARK: Output
            Section(header: Text("Final stitch count")) {//this section returns the number of stitches needed
            Text(output)
            }
        }
        .navigationTitle("Stitch Calculator🧶")
    }

    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
