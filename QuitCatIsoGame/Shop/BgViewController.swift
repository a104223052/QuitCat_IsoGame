//
//  BgViewController.swift
//  QuitCatIsoGame
//
//  Created by Chloe Lee on 2018/11/24.
//  Copyright © 2018 Kai Kuma. All rights reserved.
//

import UIKit

class BgViewController: UIViewController,CAAnimationDelegate {

    
    @IBOutlet weak var capsuleToyView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        if flag {
            print("Animation finished")
        }
        
    }
    
    @IBAction func playGifUIButton(_ sender: Any) {
        
        let CapToyGif = UIImage.gif(name: "gif4") //.gifImageWithName("gif4")
        //let capToyImageView = UIImageView(image: capsuleToyView?.image)// Do any additional setup after loading the view.
        capsuleToyView.CTloadGif(name: "gif4")
        
        var values = [CGImage]()
        for image in CapToyGif!.images! {
            values.append(image.cgImage!)
        }        // Set the images from the UIImage
        // Create animation and set SwiftGif values and duration
        let animation = CAKeyframeAnimation(keyPath: "contents")
        animation.calculationMode = CAAnimationCalculationMode.discrete
        animation.duration = CapToyGif!.duration
        animation.values = values
        // Set the repeat count
        animation.repeatCount = 1
        // Other stuff
        animation.isRemovedOnCompletion = false
        animation.fillMode = CAMediaTimingFillMode.forwards
        // Set the delegate
        animation.delegate = self
        capsuleToyView.layer.add(animation, forKey: "animation")
        
        capsuleToyView.image = UIImage(named: "牛奶1")
        capsuleToyView.animationImages = CapToyGif?.images
        // Set the duration of the UIImage
        capsuleToyView.animationDuration = CapToyGif!.duration
        // Set the repetitioncount
        capsuleToyView.animationRepeatCount = 1
        // Start the animation
        capsuleToyView.startAnimating()
        
    }
    

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
