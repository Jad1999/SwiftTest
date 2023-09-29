//
//  WelcomeViewController.swift
//  TestingApp
//
//  Created by Jad ghoson on 28/09/2023.
//

import UIKit
class WelcomeViewController: UIViewController{
   
    @IBOutlet weak var titleLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        titleLabel.text = ""//to let the title begin the animation by no word
        
        let titelText = "WELCOME"//the Text we need to animation (label)
        var charIndex = 0.0//the time to let the animation Slow
        for letter in titelText{//the Loop for let a DELAY wen we animaton
            
            
            Timer.scheduledTimer(withTimeInterval: 0.1 * Double(charIndex), repeats: false) { (timer) in//The delay
                self.titleLabel.text?.append(letter)
            }
            charIndex += 1//the var of double to let the delay big more and more
            
        }
    }
    
}
