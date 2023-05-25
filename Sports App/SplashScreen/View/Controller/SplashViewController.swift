//
//  SplashViewController.swift
//  Sports App
//
//  Created by EsraaAbdelfatah on 5/1/23.
//

import UIKit
import Lottie
class SplashViewController: UIViewController {
    private let animationView = AnimationView()
    override func viewDidLoad() {
        super.viewDidLoad()

        setupAnimations()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
               let vc = self.storyboard?.instantiateViewController(identifier: "TabBar") as! UITabBarController
                        vc.modalTransitionStyle = .crossDissolve
                        vc.modalPresentationStyle = .fullScreen
                        self.present(vc, animated: true)
                    }
    }
    
    private func setupAnimations(){
        animationView.frame = CGRect(x: 0, y: 0, width: view.frame.width , height: 400)
        animationView.center = view.center
        view.addSubview(animationView)
        animationView.animation = Animation.named("splash")
        animationView.loopMode = .playOnce
        animationView.contentMode = .scaleAspectFit
        animationView.play()
    }
  
}
