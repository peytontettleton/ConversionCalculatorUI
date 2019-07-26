//
//  ConversionCalculatorUIViewController.swift
//  ConversionCalculatorUI
//
//  Created by Peyton Tettleton on 7/11/19.
//  Copyright © 2019 Peyton Tettleton. All rights reserved.
//

import UIKit

struct UnitConverter {
    let label: String
    let convertFrom: String
    let convertTo: String
}

enum TypeConverter: String {
    case F_to_C = "Fahrenheit to Celsius"
    case C_to_F = "Celsius to Fahrenheit"
    case km_to_mi = "Kilometers to Miles"
    case mi_to_km = "Miles to Kilometers"
}

class ConversionCalculatorUIViewController: UIViewController {

    @IBOutlet weak var OutputDisplay: UITextField!
    @IBOutlet weak var InputDisplay: UITextField!
    
    
    var conversions = [UnitConverter(label: TypeConverter.F_to_C.rawValue, convertFrom: "F°", convertTo: "C°"),
                       UnitConverter(label: TypeConverter.C_to_F.rawValue, convertFrom: "C°", convertTo: "F°"),
                       UnitConverter(label: TypeConverter.mi_to_km.rawValue, convertFrom: "mi", convertTo: "km"),
                       UnitConverter(label: TypeConverter.km_to_mi.rawValue, convertFrom: "km", convertTo: "mi")]
    
    var inputNum: Double = 0
    var outputNum: Double = 0
    var inputString: String = ""
    var outputString: String = ""
    var convertFrom: String = ""
    var convertTo: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        OutputDisplay.text = "0.0C°"
        InputDisplay.text = "0.0F°"
        
        convertTo = conversions[0].convertTo
        convertFrom = conversions[0].convertFrom
        
    }
    

        
    @IBAction func converter(_ sender: Any) {
    
    let menuOptions = UIAlertController(title: "Converter Menu", message: "Choose a converter of your choice!", preferredStyle:  UIAlertController.Style.alert)
        
        for unitconverter in conversions {
            menuOptions.addAction(UIAlertAction(title: unitconverter.label, style: UIAlertAction.Style.default, handler: {
                (alertAction) -> Void in
                self.inputNum = Double(self.inputString) ?? 0
                self.convertFrom = unitconverter.convertFrom
                self.convertTo = unitconverter.convertTo
                self.InputDisplay.text = self.convertProcess(inputNum: self.inputNum, convertFrom: self.convertFrom)
                self.OutputDisplay.text = self.convertComplete(inputNum: self.inputNum, convertTo: self.convertTo)
            }
            ))
        }
 
        menuOptions.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
        self.present(menuOptions, animated: true, completion: nil)
    }
    
    func convertProcess(inputNum: Double, convertFrom: String) -> String
    {
        var inputString1 = String(inputNum)
        inputString1.append(convertFrom)
        return inputString1
    }
    
    func convertComplete(inputNum: Double, convertTo: String) -> String {
        if convertFrom == "C°"
        {
            outputNum = inputNum * 9/5 + 32
        }
        else if convertFrom == "F°"
        {
            outputNum = (inputNum - 32) * 5/9
        }
        else if convertFrom == "km"
        {
            outputNum = inputNum * 0.621371
        }
        else if convertFrom == "mi"
        {
            outputNum = inputNum * 1.60934
        }
        
        outputNum = round(outputNum * 100) / 100
        
        var outputString1 = String(outputNum)
        outputString1.append(convertTo)
        return outputString1
    }
    
    @IBAction func decimal(_ sender: Any) {
        inputString.append(".")
        InputDisplay.text = convertProcess(inputNum: inputNum, convertFrom: convertFrom)
    }
    
    
    @IBAction func zero(_ sender: Any) {
        inputString.append("0")
        inputNum = Double(inputString) ?? 0
        InputDisplay.text = convertProcess(inputNum: inputNum, convertFrom: convertFrom)
        OutputDisplay.text = convertComplete(inputNum: inputNum, convertTo: convertTo)
    }
    

    @IBAction func one(_ sender: Any) {
        inputString.append("1")
        inputNum = Double(inputString) ?? 0
        InputDisplay.text = convertProcess(inputNum: inputNum, convertFrom: convertFrom)
        OutputDisplay.text = convertComplete(inputNum: inputNum, convertTo: convertTo)
    }
    

    @IBAction func two(_ sender: Any) {
        inputString.append("2")
        inputNum = Double(inputString) ?? 0
        InputDisplay.text = convertProcess(inputNum: inputNum, convertFrom: convertFrom)
        OutputDisplay.text = convertComplete(inputNum: inputNum, convertTo: convertTo)
    }
    
    
    @IBAction func three(_ sender: Any) {
        inputString.append("3")
        inputNum = Double(inputString) ?? 0
        InputDisplay.text = convertProcess(inputNum: inputNum, convertFrom: convertFrom)
        OutputDisplay.text = convertComplete(inputNum: inputNum, convertTo: convertTo)
    }
    
    
    @IBAction func six(_ sender: Any) {
        inputString.append("6")
        inputNum = Double(inputString) ?? 0
        InputDisplay.text = convertProcess(inputNum: inputNum, convertFrom: convertFrom)
        OutputDisplay.text = convertComplete(inputNum: inputNum, convertTo: convertTo)
    }
    
    
    @IBAction func five(_ sender: Any) {
        inputString.append("5")
        inputNum = Double(inputString) ?? 0
        InputDisplay.text = convertProcess(inputNum: inputNum, convertFrom: convertFrom)
        OutputDisplay.text = convertComplete(inputNum: inputNum, convertTo: convertTo)
    }
    
    @IBAction func four(_ sender: Any) {
        inputString.append("4")
        inputNum = Double(inputString) ?? 0
        InputDisplay.text = convertProcess(inputNum: inputNum, convertFrom: convertFrom)
        OutputDisplay.text = convertComplete(inputNum: inputNum, convertTo: convertTo)
    }

    
    @IBAction func seven(_ sender: Any) {
        inputString.append("8")
        inputNum = Double(inputString) ?? 0
        InputDisplay.text = convertProcess(inputNum: inputNum, convertFrom: convertFrom)
        OutputDisplay.text = convertComplete(inputNum: inputNum, convertTo: convertTo)
    }

    @IBAction func eight(_ sender: Any) {
        inputString.append("8")
        inputNum = Double(inputString) ?? 0
        InputDisplay.text = convertProcess(inputNum: inputNum, convertFrom: convertFrom)
        OutputDisplay.text = convertComplete(inputNum: inputNum, convertTo: convertTo)
    }

    @IBAction func nine(_ sender: Any) {
        inputString.append("9")
        inputNum = Double(inputString) ?? 0
        InputDisplay.text = convertProcess(inputNum: inputNum, convertFrom: convertFrom)
        OutputDisplay.text = convertComplete(inputNum: inputNum, convertTo: convertTo)
    }

    
    @IBAction func clear(_ sender: Any) {
        inputNum = 0
        inputString = ""
        outputString = ""
        InputDisplay.text = convertFrom
        OutputDisplay.text = convertTo
    }

    @IBAction func plusminus(_ sender: Any) {
        inputNum *= -1
        InputDisplay.text = convertProcess(inputNum: inputNum, convertFrom: convertFrom)
        OutputDisplay.text = convertComplete(inputNum: inputNum, convertTo: convertTo)
    }

    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
