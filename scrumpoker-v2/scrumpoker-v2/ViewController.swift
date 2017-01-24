//
//  ViewController.swift
//  scrumpoker-v2
//
//  Created by Stagiare 2 on 24-01-17.
//  Copyright © 2017 Stagiare 2. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    var feedbackLabel = UILabel(frame: CGRect.zero)
    var currentValue:CGFloat = 0.0 {
        didSet {
            if (currentValue > 100) {
                currentValue = 100
            }
            if (currentValue < 0) {
                currentValue = 0
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        self.view.addGestureRecognizer(XMCircleGestureRecognizer(midPoint: self.view.center, target: self, action: #selector(ViewController.rotateGesture(recognizer:))))
        
        //add feedbackLabel
        feedbackLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(feedbackLabel)
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[view]-|", options: [], metrics: nil, views: ["view":feedbackLabel]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[view]-|", options: [], metrics: nil, views: ["view":feedbackLabel]))
        
        feedbackLabel.textAlignment = .center
        feedbackLabel.numberOfLines = 0;
        feedbackLabel.font = UIFont(name: "HelveticaNeue-Thin", size: 20)
        feedbackLabel.text = "Perform a gesture here."
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func rotateGesture(recognizer:XMCircleGestureRecognizer)
    {
        feedbackLabel.text = ""
        if let rotation = recognizer.rotation {
            currentValue += rotation.degrees / 360 * 100
            feedbackLabel.text = feedbackLabel.text! + String(format:"Value: %.2f%%", currentValue)
        }
        if let angle = recognizer.angle {
            feedbackLabel.text = feedbackLabel.text! + "\n" + String(format:"Angle: %.2f%", angle.degrees)
        }
        
        if let distance = recognizer.distance {
            feedbackLabel.text = feedbackLabel.text! + "\n" + String(format:"Distance: %.0f%", distance)
        }
    }


}

