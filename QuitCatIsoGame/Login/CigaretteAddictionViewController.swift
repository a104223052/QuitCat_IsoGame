//
//  CigaretteAddictionViewController.swift
//  QuitCatIsoGame
//
//  Created by 熊開智 on 2018/10/21.
//  Copyright © 2018 Kai Kuma. All rights reserved.
//

import UIKit

class CigaretteAddictionViewController: UIViewController, SSRadioButtonControllerDelegate {
    
    func didSelectButton(selectedButton: UIButton?) {
        
    }
    

    @IBOutlet weak var TestQuestionView: UIView!
    @IBOutlet weak var Question1View: UIView!
    @IBOutlet var Question1Button: [UIButton]!
    
    
    var radioButtonController: SSRadioButtonsController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TestQuestionView.layer.cornerRadius = 20
        TestQuestionView.layer.shadowOffset = CGSize(width: 0, height: 2)
        TestQuestionView.layer.shadowOpacity = 0.7
        TestQuestionView.layer.shadowRadius = 5
        TestQuestionView.layer.shadowColor = UIColor(red: 44.0/255.0, green: 62.0/255.0, blue: 80.0/255.0, alpha: 1.0).cgColor

        
        radioButtonController = SSRadioButtonsController(buttons: Question1Button)
        radioButtonController!.delegate = self
        radioButtonController!.shouldLetDeSelect = true
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
