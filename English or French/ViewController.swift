//
//  ViewController.swift
//  English or French
//
//  Created by Li, Muchen on 2019-11-26.
//  Copyright © 2019 Li, Muchen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Properties
    @IBOutlet weak var inputField: UITextView!

    @IBOutlet weak var outputResult: UILabel!
    
    //MARK: Function (make things happen)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func analyzeText(_ sender: Any) {
        //clear out the ourput label from the last time
        outputResult.text = ""
        
        //guard against input
        guard let phraseInput = inputField.text, !phraseInput.isEmpty else {
            outputResult.text = "Please enter a string please"
            return
        }
        
        //give output
        analyze(text: phraseInput)
    }
    
    func analyze(text: String)  {
        
        //set s and t values
        var sValue = 0
        var tValue = 0
        
        //determine the number of t and s letters in the input
        for character in text {
            
            switch character{
            case "s", "S":
                sValue += 1
            case "t", "T":
                tValue += 1
            default:
                sValue += 0
            }
            
        }
        
        //compare the number of s and t values
        if sValue > tValue{
            outputResult.text = "This looks like French"
        }else if sValue < tValue{
            outputResult.text = "This looks like English"
        }else if tValue == sValue && tValue != 0 && sValue != 0{
            outputResult.text = "This looks like French"
        }else if sValue == 0 && tValue == 0{
            outputResult.text = "none"
        }
        
    }
    
    
}

