//
//  Functions.swift
//  Knitting Gauge Converter
//
//  Created by Harris-Stoertz, Rowan on 2021-02-03.
//

import Foundation

/// converts inches to centimeters
/// - Parameter startingDistance: the distance in inches to be converted
/// - Returns: the converted distance in centimeters
func inchesToCentimeters(startingDistance: Double) -> Double {
    return (startingDistance * 2.54)
}

/// converts feet to centimeters
/// - Parameter startingDistance: the distance in feet to be converted
/// - Returns: the converted distance in centimeters
func feetToCentimeters(startingDistance: Double) -> Double {
    return (startingDistance * 30.48)
}

/// converts millimeters to centimeters
/// - Parameter startingDistance: the distance in millimeters to be converted
/// - Returns: the converted distance in centimeters
func millimetersToCentimeters(startingDistance: Double) -> Double {
    return (startingDistance / 10.0)
}

/// converts centimeters to inches
/// - Parameter startingDistance: the distance in centimeters to be converted
/// - Returns: the converted distance in inches
func centimetersToInches(CMDistance: Double) -> Double {
    return (CMDistance / 2.54)
}

/// converts centimeters to feet
/// - Parameter startingDistance: the distance in centimeters to be converted
/// - Returns: the converted distance in feet
func centimetersToFeet(CMDistance: Double) -> Double {
    return (CMDistance / 30.48)
}

/// converts centimeters to millimeters
/// - Parameter startingDistance: the distance in centimeters to be converted
/// - Returns: the converted distance in millimeters
func centimetersToMillimeters(CMDistance: Double) -> Double {
    return (CMDistance * 10.0)
}

/// prints a menu with the different options for units (not used in ui)
func printMenu(){
    print("1 - inches")
    print("2 - feet")
    print("3 - centimeters")
    print("4 - millimeters")
}

/// calculates the number of stitches long needed to acheive a project of desired size
/// - Parameters:
///   - startingUnit: the unit of measurement that the user submits gauge swatch measurements in
///   - swatchLength: the measurement of the length of the gauge swatch
///   - endingUnit: the unit of measurement that the user submits their desired length in
///   - swatchStitchLength: number of rows that the gauge swatch is
///   - finalLength: desired length
/// - Returns: number of stitches needed to create their project
func getRequiredLength (startingUnit: String, swatchLength: Double, endingUnit: String, swatchStitchLength: Double, finalLength: Double) -> Double {
    var CMLength = 0.0
    var convertedLength = 0.0
    switch startingUnit{
    case "1": CMLength = inchesToCentimeters(startingDistance: swatchLength)
    case "2": CMLength = feetToCentimeters(startingDistance: swatchLength)
    case "3": CMLength = swatchLength
    case "4": CMLength = millimetersToCentimeters(startingDistance: swatchLength)
    default:
        break}//converts length to cm
    switch endingUnit{
    case "1": convertedLength = centimetersToInches(CMDistance: CMLength)
    case "2": convertedLength = centimetersToFeet(CMDistance: CMLength)
    case "3": convertedLength = swatchLength
    case "4": convertedLength = centimetersToMillimeters(CMDistance: CMLength)
    default:
        break}//converts length in cm to the unit for the final project
    let lengthDensity = swatchStitchLength/convertedLength//calculates how big each stitch is
    return finalLength * lengthDensity
}

/// calculates the number of stitches wide needed to acheive a project of desired size
/// - Parameters:
///   - startingUnit: the unit of measurement that the user submits gauge swatch measurements in
///   - swatchWidth: the measurement of the width of the gauge swatch
///   - endingUnit: the unit of measurement that the user submits their desired width in
///   - swatchStitchLength: number of stitches wide that the gauge swatch is
///   - finalLength: desired width
/// - Returns: number of stitches needed to create their project
func getRequiredWidth (startingUnit: String, swatchWidth: Double, endingUnit: String, swatchStitchWidth: Double, finalWidth: Double) -> Double {
    var CMWidth = 0.0
    var convertedWidth = 0.0
    switch startingUnit{
    case "1": CMWidth = inchesToCentimeters(startingDistance: swatchWidth)
    case "2": CMWidth = feetToCentimeters(startingDistance: swatchWidth)
    case "3": CMWidth = swatchWidth
    case "4": CMWidth = millimetersToCentimeters(startingDistance: swatchWidth)
    default:
        break}//converts width to cm
    switch endingUnit{
    case "1": convertedWidth = centimetersToInches(CMDistance: CMWidth)
    case "2": convertedWidth = centimetersToFeet(CMDistance: CMWidth)
    case "3": convertedWidth = swatchWidth
    case "4": convertedWidth = centimetersToMillimeters(CMDistance: CMWidth)
    default:
        break}//converts width in cm to the unit for the final project
    let widthDensity = swatchStitchWidth/convertedWidth//calculates how big each stitch is
    return finalWidth * widthDensity
}
