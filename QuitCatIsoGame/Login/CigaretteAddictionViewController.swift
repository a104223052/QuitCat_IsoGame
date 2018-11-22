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
        
//        let leftBarBtn = UIBarButtonItem(title: "", style: .plain, target: self,
//                                         action: #selector(backToPrevious))
//        leftBarBtn.image = UIImage(named: "Btn_返回")
//        self.navigationItem.setLeftBarButton(leftBarBtn, animated: true)
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func nextButtonClick(_ sender: UIButton) {
        let tag1 = radioButtonController1?.selectedButton()?.tag
        let tag2 = radioButtonController2?.selectedButton()?.tag
        let tag3 = radioButtonController3?.selectedButton()?.tag
        
        if tag1 != nil && tag2 != nil && tag3 != nil {
            self.performSegue(withIdentifier: "CigaretteAddictionViewController2CigaretteAddiction2ViewController", sender: sender.tag)
        }
        else {
            let alert = UIAlertController(title: nil, message: "尚未填寫所有選項", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "好的", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }

    }
    
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        let tag1 = radioButtonController1?.selectedButton()?.tag
        let tag2 = radioButtonController2?.selectedButton()?.tag
        let tag3 = radioButtonController3?.selectedButton()?.tag
        
        
        let controller = segue.destination as! cccadd2ViewController
        
        controller.answerScore = [tag1, tag2, tag3] as! [Int]
        
    }

}
