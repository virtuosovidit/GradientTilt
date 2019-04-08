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
        gradient.colors = [UIColor.red.cgColor, UIColor.blue.cgColor]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
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
        gradient?.startPoint.x = viewerOffset.horizontal
        return nil
    }
    
}
