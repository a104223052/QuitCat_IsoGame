//
//  SwitchPages.swift
//  QuitCatIsoGame
//
//  Created by 熊開智 on 2018/11/14.
//  Copyright © 2018 Kai Kuma. All rights reserved.
//
import UIKit

protocol getUserIDDelegate {
    func getUserID(_ userID: String)
}

class SwitchPages {
    func switchFromRight(viewControllew: UIViewController) {
        let transition = CATransition()
        transition.duration = 0.2
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        viewControllew.view.window!.layer.add(transition, forKey: kCATransition)
    }
    
    func switchPagesByPresent(viewController: UIViewController, ID: String) {
        if let controller = viewController.storyboard?.instantiateViewController(withIdentifier: ID) {
            viewController.present(controller, animated: false, completion: nil)
        }
    }
}
