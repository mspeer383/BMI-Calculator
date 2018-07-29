//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Speer, Michael on 7/24/18.
//  Copyright © 2018 Michael Speer. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    
    @IBOutlet weak var categorization: UILabel!
    
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var heightInput: UITextField!
    
   
    @IBOutlet weak var weightInput: UITextField!
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func calcBMI(weight: Double, height: Double ) -> Double {
        var bmi : Double = 0
        let footHeight = Measurement(value: height, unit: UnitLength.feet)
        print ("foot heigh = \(footHeight)")
        
        let meterHeight = footHeight.converted(to: .meters)
        print("meter height =\(meterHeight) ")
        
        let poundBmi = Measurement(value: weight, unit: UnitMass.pounds)
        
        let kiloBmi = poundBmi.converted(to: .kilograms)
        
        print("pounds = \(poundBmi)")
        print("kilos = \(kiloBmi)")
        
        
        bmi = kiloBmi.value / (pow(meterHeight.value,2))
        print(bmi)
        
        return bmi
    
    }
    
    @IBAction func calculateButton(_ sender: Any) {
   
        var doubleWeight : Double = 0
        var doubleHeight : Double = 0
        var calculatedBMI : Double
        
        
        if (weightInput.text != nil) {
            doubleWeight =  Double(weightInput.text!)!
        }
        
        if (heightInput.text != nil){
            doubleHeight = Double(heightInput.text!)!
        }
        
        
        //do the math
        calculatedBMI = calcBMI(weight: doubleWeight, height: doubleHeight)
        
        //show the result
        resultLabel.text = String(calculatedBMI)
        
        //show the advice
        categorization.text = getCategorizationString(doubleBMI: calculatedBMI)
    }
    
    func getCategorizationString(doubleBMI: Double) -> String {
        var resultString: String
        if (doubleBMI > 25 ){
            resultString = "You are overweight"
        }
        else if (doubleBMI > 18.5 && doubleBMI <= 25) {
            resultString = "You are in the zone healthy"
        }
        else {
            resultString = "You are under weight eat some more"
        }
        return resultString
    }
    
    override func touchesBegan(_ touches: Set<UITouch>,
                               with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

