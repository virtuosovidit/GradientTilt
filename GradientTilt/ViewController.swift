//
//  ViewController.swift
//  GradientTilt
//
//  Created by Vidit Bhargava on 07/04/19.
//  Copyright © 2019 Vidit Bhargava. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        addGradient()
        update()
        gradientView.mask = label
    }
    
    @IBOutlet weak var gradientView: UIView!
    @IBOutlet weak var label: UILabel!
    
    func addGradient() {
        let gradient = CAGradientLayer()
        gradient.frame = gradientView.bounds
        
        /* Option 1:
        gradient.colors = [UIColor.red.cgColor, UIColor.blue.cgColor]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradientView.layer.addSublayer(gradient)
         */
        
        /* Option 2:
        gradient.colors = [UIColor(white: 0.7, alpha: 1).cgColor, UIColor(white: 0.88, alpha: 1).cgColor, UIColor(white: 0.7, alpha: 1).cgColor]
        gradient.startPoint = CGPoint(x: 0.5, y: 0)
        gradient.startPoint = CGPoint(x: 0.5, y: 1)
        gradientView.layer.addSublayer(gradient)
        */
        
        gradient.colors = [UIColor(displayP3Red: 194/255, green: 141/255, blue: 34/255, alpha: 1).cgColor,
                           UIColor(displayP3Red: 240/255, green: 194/255, blue: 42/255, alpha: 1).cgColor,
                           UIColor(displayP3Red: 194/255, green: 141/255, blue: 34/255, alpha: 1).cgColor]
        
        gradient.startPoint = CGPoint(x: 1.0, y: 0.5)
        gradient.startPoint = CGPoint(x: 0.5, y: 1)
        
        gradientView.layer.addSublayer(gradient)
    }
    
    func update() {
        
        let motionEffectGroup = GradientMotionEffect()
        motionEffectGroup.gradient = gradientView.layer.sublayers?.last as? CAGradientLayer
        
        gradientView.addMotionEffect(motionEffectGroup)
    }
    
    
    
    
}

class GradientMotionEffect: UIMotionEffect {
    var gradient: CAGradientLayer?
    
    override func keyPathsAndRelativeValues(forViewerOffset viewerOffset: UIOffset) -> [String : Any]? {
        gradient?.startPoint.x = 1 + viewerOffset.horizontal
        gradient?.startPoint.y = 0.5 + viewerOffset.vertical
        
        gradient?.endPoint.x = 0 + viewerOffset.horizontal
        gradient?.endPoint.y = 1 + viewerOffset.vertical
        
        return nil
    }
    

    
}
