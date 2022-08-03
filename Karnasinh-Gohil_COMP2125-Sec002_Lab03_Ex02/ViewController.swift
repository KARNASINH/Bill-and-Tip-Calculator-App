//
//  ViewController.swift
//  Karnasinh-Gohil_COMP2125-Sec002_Lab03_Ex02
//
//  Created by user211304 on 7/17/22.
//

import UIKit

class ViewController: UIViewController {

    //This is for bill amount and slider
    @IBOutlet weak var billAmount: UITextField!
    
    @IBOutlet weak var tipSlider: UISlider!
    
    //These are for default 15% tip
    @IBOutlet weak var tipAmount1: UILabel!
    
    @IBOutlet weak var tipTotal1: UILabel!
    
    //These are for custome tip
    @IBOutlet weak var tipAmount2: UILabel!
    
    @IBOutlet weak var tipTotal2: UILabel!
    
    //These are the lables for custome tip display
    @IBOutlet weak var customTip1: UILabel!
    
    @IBOutlet weak var customTip2: UILabel!
    
    //This method display settings as view loads first time.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Default Custom tip value is 18%
        customTip1.text = "18%"
        customTip2.text = "18%"
    }

    //This method do calculation as user move slider
    @IBAction func sliderTip(_ sender: UISlider)
    {
        //Getting value from the slider
        var ctip1 = Int(round(sender.value))
        
        //Displaying value of custom tip as user moves slider
        customTip1.text = ctip1.description + "%"
        
        //Displaying value of custom tip as user moves slider
        customTip2.text = ctip1.description + "%"
        
        //Converting text value into percentage
        var ctip2 = Double(ctip1)/Double(100)
        
        //Declared variable to store tip amount as a dollar.
        var tip1:Double
        
        tip1 = ((Double(billAmount.text!) ?? 0) * ctip2)
        
        //Displaying tip amount with 1 fractional value
        tipAmount2.text = String(format:"%.1f", tip1)
        
        //Displaying total bill amount including custom tip amount
        tipTotal2.text = ((Double(billAmount.text!) ?? 0) + tip1 ).description
    }
    
    
    //This method will calcualte tip amount as user enter or change value in bill amount.
    @IBAction func billAmountChange(_ sender: UITextField) {
        
        //Getting slider's value
        var sliderValue = tipSlider.value
        
        //Converting slider text into percentage value
        var ctip2 = Double(sliderValue)/Double(100)
        
        //This will store bill amount value in it.
        var tip1:Double
        
        //Storing bill aomunt into variable
        tip1 = ((Double(billAmount.text!) ?? 0) * ctip2)
        
        //DIaplying custome tip amount on the lable
        tipAmount2.text = tip1.description
        
        //Displaying custome total bill amount on the lable
        tipTotal2.text = ((Double(billAmount.text!) ?? 0) + tip1 ).description
        
        //Declared variable to store default tip amount
        var tip2:Double
        
        //Calculate and storing tip amount into variable
        tip2 = ((Double(billAmount.text!) ?? 0) * 0.15)
        
        //Displaying default 15% tip amount on the lable
        tipAmount1.text = String(format:"%.1f", tip2)
        
        //Displayting total bill amount for 15% default tip
        tipTotal1.text = ((Double(billAmount.text!) ?? 0) + tip2 ).description
        
    }
}

