//
//  ViewController.swift
//  RetirementNumberOSX
//
//  Created by Henry Arias on 4/12/16.
//  Copyright © 2016 Henry Arias. All rights reserved.
//
import Foundation
import Cocoa
// custom operation for running exponents
infix operator ** { associativity left precedence 170 }

func ** (num: Double, power: Double) -> Double{
    return pow(num, power)
}


class ViewController: NSViewController {
    class RetirementNumber {
        // class properties and values
        var currentSalary: Double
        var salaryPercent: Double
        var inflationRate: Double
        var socialSecurity: Double
        var retirementYears: Double
        var needForRetirement: Double
        var currentSavings: Double
        var yearsInRetirement: Double
        //default value initializer
        init () {
            self.currentSalary = 50000
            self.salaryPercent = 0.80
            self.inflationRate = 0.03
            self.socialSecurity = 18000
            self.retirementYears = 20
            self.needForRetirement = 60000
            self.currentSavings = 50000
            self.yearsInRetirement = 25
        
        }
        func calculatedSalaryNeed () -> Double {
            var calculatedSalary: Double = 0.0
            if self.currentSalary > 0.0 {
                let calculatedSalaryResult = ((((((self.currentSalary) * (self.salaryPercent))
                    * ((self.inflationRate + 1.0) ** (self.retirementYears))) - (self.socialSecurity))
                    * (self.yearsInRetirement - 5)) - (self.currentSavings))
                
                calculatedSalary = calculatedSalaryResult
               
            }
            return calculatedSalary
        }
    }
    
  
   

    override func viewDidLoad() {
        super.viewDidLoad()
    
        

        // Do any additional setup after loading the view.
        // set some currency and percent format styles
        // set some default values
        let percent = NSNumberFormatter()
        percent.numberStyle = .PercentStyle
        let currency = NSNumberFormatter()
        currency.numberStyle = .CurrencyStyle
        
        salaryPercent.stringValue = percent.stringFromNumber(0.80)!
        salary.stringValue = currency.stringFromNumber(40000)!
        inflationRate.stringValue = percent.stringFromNumber(0.03)!
        socialSecurityBenefit.stringValue = currency.stringFromNumber(15000)!
        yearsInRetirement.stringValue = "25"
        yearsToRetirement.stringValue = "18"
        currentRetirementSavings.stringValue = currency.stringFromNumber(40000)!
        
        
    }

    
    // get values from text input boxes
    @IBOutlet weak var salaryPercent: NSTextField!
    @IBOutlet weak var salary: NSTextField!
    @IBOutlet weak var inflationRate: NSTextField!
    @IBOutlet weak var socialSecurityBenefit: NSTextField!
    @IBOutlet weak var yearsToRetirement: NSTextField!
    @IBOutlet weak var fundsNeededForRetirement: NSTextField!
    @IBOutlet weak var currentRetirementSavings: NSTextField!
    @IBOutlet weak var yearsInRetirement: NSTextField!
    
    var userIsEnteringData = false
    
    
    
   
    
    @IBAction func calculate(sender: NSButton) {
        
        // populate the class values
        let computedRetirementNumber = RetirementNumber()
        computedRetirementNumber.currentSalary = salary.doubleValue
        computedRetirementNumber.salaryPercent = salaryPercent.doubleValue
        computedRetirementNumber.inflationRate = inflationRate.doubleValue
        computedRetirementNumber.socialSecurity = socialSecurityBenefit.doubleValue
        computedRetirementNumber.retirementYears = yearsToRetirement.doubleValue
        computedRetirementNumber.yearsInRetirement = yearsInRetirement.doubleValue
        //if userIsEnteringData { will use this later on
            let calculatedSalaryRetirement = computedRetirementNumber.calculatedSalaryNeed()
            fundsNeededForRetirement.doubleValue = calculatedSalaryRetirement
       //format for currency to display in the Funds needed for Retirement Textbox
        let format = NSNumberFormatter()
        format.numberStyle = .CurrencyStyle
        
        fundsNeededForRetirement.stringValue = (format.stringFromNumber(calculatedSalaryRetirement))!
      
                    print(calculatedSalaryRetirement) // for testing output only
        
    
    }


   override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }

}


