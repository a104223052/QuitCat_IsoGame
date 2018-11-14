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
    
    var delegate: getUserIDDelegate?
    
    func switchFromRight(viewControllew: UIViewController) {
        let transition = CATransition()
        transition.duration = 0.2
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        viewControllew.view.window!.layer.add(transition, forKey: kCATransition)
    }
    
    func switchFromLeft(viewControllew: UIViewController) {
        let transition = CATransition()
        transition.duration = 0.2
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        viewControllew.view.window!.layer.add(transition, forKey: kCATransition)
    }
    
    func createPagesByPresent(viewController: UIViewController, ID: String) {
    viewController.storyboard?.instantiateViewController(withIdentifier: "InformationSettingViewController")
    }
}
