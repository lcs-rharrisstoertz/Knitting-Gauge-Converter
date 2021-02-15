//
//  HowToUse.swift
//  iOS- KnittingGaugeConverter
//
//  Created by Harris-Stoertz, Rowan on 2021-02-14.
//

import SwiftUI

struct HowToUse: View {
    var body: some View {
        ScrollView {
        Text("""
            This app calculates the number of stitches and rows needed to knit a project of a desired size.
            To use this app, knit a square using the same yarn, needle size, and stitch type as you plan to use for your final project. This is a gauge swatch.
            """)
            .multilineTextAlignment(.leading)
            .padding()
            Image("gaugeSwatch")
                .resizable()
                .scaledToFit()
        Text("""
            If you plan to wash your completed project, wash the gauge swatch before measuring it. Washing a project can cause it to shrink or stretch, which will change the size of the project.
            Measure the gauge swatch. Enter the measurements and stitch count into the calculator and select the appropriate unit of measurement.
            Some yarn has measurements and stitch counts on the label. Using these measurements and stitch counts will give an approximate result, but the size of your final project may be a bit off if your stitches are looser or tighter than average.
            """)
            .multilineTextAlignment(.leading)
            .padding()
        Image("yarnLabel")
            .resizable()
            .scaledToFit()
        Text("""
                Enter your desired measurements for your project and select the appropriate unit.
                The calculator will return the number of stitches and rows you need to make your project the correct size!
                """)
            .multilineTextAlignment(.leading)
                .padding()
        }
        .navigationTitle("Instructions")
    }
}

struct HowToUse_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HowToUse()
        }
    }
}
