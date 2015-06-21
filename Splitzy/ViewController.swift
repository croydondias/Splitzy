//
//  ViewController.swift
//  Splitzy
//
//  Created by Croydon Dias on 21/06/2015.
//  Copyright (c) 2015 Croydon Dias. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var totalField: UITextField!
    @IBOutlet weak var serviceChargeField: UITextField!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var numOfPeopleLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        stepper.autorepeat = true
        stepper.minimumValue = 2
        stepper.maximumValue = 1000
        numOfPeopleLabel.text = Int(stepper.minimumValue).description
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func stepperValueChanged(sender: UIStepper) {
        numOfPeopleLabel.text = Int(sender.value).description
    }
    
    @IBAction func calculateButtonClicked(sender: AnyObject) {
        println("Calculate clicked")
        
        self.totalField.resignFirstResponder()
        self.serviceChargeField.resignFirstResponder()
        
        var total = 0.0
        total += (self.totalField.text as NSString).doubleValue
        total += (self.serviceChargeField.text as NSString).doubleValue
        var people = Int(self.stepper.value)
        
        println("total is \(total)")
        println("Splitting the total by \(people) people")
        
        var individualCost = Double(total) / Double(people)
        println("Cost pp is \(individualCost)")
        
        var result = String(format: "%.2f per person", individualCost)
        println(result)
        resultLabel.text = result
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
}

