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
    
    
    // MARK: Computed properties
    private var output: String {
        return "To achieve your desired dimensions, your project needs to be requiredWidth stitches wide and requiredLength rows long!"
    }
    
    var body: some View {

        Form {
            TextField("How many stitches wide is the gauge swatch?", text: $swatchStitchWidth)
                .keyboardType(.numberPad)
            TextField("How many rows long is the gauge swatch?", text: $swatchStitchLength)
                .keyboardType(.numberPad)
            Picker("Starting unit:")
            
            Text(output)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
