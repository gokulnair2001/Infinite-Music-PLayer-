//
//  launchViewController.swift
//  INFINITE
//
//  Created by Gokul Nair on 18/06/20.
//  Copyright © 2020 Gokul Nair. All rights reserved.
//

import UIKit
import Lottie


class launchViewController: UIViewController {

    let animationView = AnimationView()
        
    override func viewDidLoad() {
        super.viewDidLoad()

        startAnimation()
    }
    

    func startAnimation() {
        animationView.animation = Animation.named("a")
        animationView.frame = view.bounds
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
        view.addSubview(animationView)
    }
}
