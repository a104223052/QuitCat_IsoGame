//
//  CigaretteAddictionViewController.swift
//  QuitCatIsoGame
//
//  Created by 熊開智 on 2018/10/21.
//  Copyright © 2018 Kai Kuma. All rights reserved.
//

import UIKit

/***
 database
 1. 完成測驗上傳資料庫
 */


class CigaretteAddictionViewController: UIViewController, SSRadioButtonControllerDelegate {//cp this
    
    func didSelectButton(selectedButton: UIButton?) {
        
    }
    

    @IBOutlet weak var TestQuestionView: UIView!
    @IBOutlet weak var Question1View: UIView!
    @IBOutlet var Question1Button: [UIButton]!
    @IBOutlet var Question2Button: [UIButton]!
    @IBOutlet var Question3Button: [UIButton]!
    
    
    var radioButtonController1: SSRadioButtonsController?//cp this
    var radioButtonController2: SSRadioButtonsController?
    var radioButtonController3: SSRadioButtonsController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TestQuestionView.layer.cornerRadius = 20
        TestQuestionView.layer.shadowOffset = CGSize(width: 0, height: 2)
        TestQuestionView.layer.shadowOpacity = 0.7
        TestQuestionView.layer.shadowRadius = 5
        TestQuestionView.layer.shadowColor = UIColor(red: 44.0/255.0, green: 62.0/255.0, blue: 80.0/255.0, alpha: 1.0).cgColor
        
        
        radioButtonController1 = SSRadioButtonsController(buttons: Question1Button)//cp this
        radioButtonController2 = SSRadioButtonsController(buttons: Question2Button)
        radioButtonController3 = SSRadioButtonsController(buttons: Question3Button)
        radioButtonController1!.delegate = self//cp this
        radioButtonController1!.shouldLetDeSelect = true//cp this
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
