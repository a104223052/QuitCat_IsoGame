//
//  GameViewController.swift
//  QuitCatIsoGame
//
//  Created by 熊開智 on 2018/10/31.
//  Copyright © 2018 Kai Kuma. All rights reserved.
//

import UIKit

class TestGameViewController: UIViewController, SSRadioButtonControllerDelegate{
    func didSelectButton(selectedButton: UIButton?) {
        
    }

    @IBOutlet weak var myGifView: UIImageView!
    @IBOutlet var recordView: UIView!
    @IBOutlet var selectedButton: [UIButton]!
    var radioButtonController1: SSRadioButtonsController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        recordView.layer.borderWidth = 3
        recordView.layer.borderColor = UIColor.white.cgColor
        
        myGifView.loadGif(name: "standtest_0")
        
        radioButtonController1 = SSRadioButtonsController(buttons: selectedButton)//cp this
        radioButtonController1!.delegate = self//cp this
        radioButtonController1!.shouldLetDeSelect = true
        
        // Do any additional setup after loading the view.
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
