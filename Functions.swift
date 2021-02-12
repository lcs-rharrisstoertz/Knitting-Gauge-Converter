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

func printMenu(){
    print("1 - inches")
    print("2 - feet")
    print("3 - centimeters")
    print("4 - millimeters")
}


