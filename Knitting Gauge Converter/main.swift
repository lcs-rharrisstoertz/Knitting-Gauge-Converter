//
//  main.swift
//  Knitting Gauge Calculator
//
//  Created by Harris-Stoertz, Rowan on 2021-02-03.
//

import Foundation
var CMWidth = 0.0
var CMLength = 0.0
var convertedLength = 0.0
var convertedWidth = 0.0

//input
print("Knitting Gauge Converter")
print("========================")
print("Please knit a square or rectangular gauge swatch using the same yarn and needle size you will be using for your project")
print("If you plan to wash your finished project, wash your gauge swatch before measuring")
print("========================")
let swatchStitchWidth = Double.collectInput(withPrompt: "How many stitches wide is your gauge swatch? ", minimum: 0, maximum: nil)
let swatchStitchLength = Double.collectInput(withPrompt: "How many rows long is your gauge swatch? ", minimum: 0, maximum: nil)//gets stitch count of knitted gauge
print("========================")
print("Please measure the length and width of your gauge swatch")
print("========================")
printMenu()
let startingUnit = String.collectInput(withPrompt: "Please enter your selection: ", acceptableValues: ["1", "2", "3", "4"])//gets the unit of measurement that the gauge is measured in

let swatchLength = Double.collectInput(withPrompt: "How many units long is your gauge swatch? ", minimum: 0, maximum: nil)
let swatchWidth = Double.collectInput(withPrompt: "How many units wide is your gauge swatch? ", minimum: 0, maximum: nil)//gets size of gauge

print ("Which unit of distance are your desired measurements for your completed project in?")
printMenu()
let endingUnit = String.collectInput(withPrompt: "Please enter your selection: ", acceptableValues: ["1", "2", "3", "4"])//gets the unit of measurement that the final project is measured in

let finalLength = Double.collectInput(withPrompt: "How many units long would you like your completed project to be? ", minimum: 0, maximum: nil)
let finalWidth = Double.collectInput(withPrompt: "How many units wide would you like your completed project to be? ", minimum: 0, maximum: nil)//gets measurements of final project

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

let widthDensity = swatchStitchWidth/convertedWidth
let lengthDensity = swatchStitchLength/convertedLength//calculates how big each stitch is

let requiredLength = finalLength * lengthDensity
let requiredWidth = finalWidth * widthDensity//given the stitch size, calculates the number of stitches required to get the desired size

print("========================")
print("To achieve your desired dimensions, your project needs to be \(requiredWidth) stitches wide and \(requiredLength) rows long!")



