//
//  cccadd2ViewController.swift
//  QuitCatIsoGame
//
//  Created by 熊開智 on 2018/10/31.
//  Copyright © 2018 Kai Kuma. All rights reserved.
//

import UIKit

class cccadd2ViewController: UIViewController, SSRadioButtonControllerDelegate {
    func didSelectButton(selectedButton: UIButton?) {
        
    }
    

    @IBOutlet weak var TestQuestionView: UIView!
    @IBOutlet var Question1Button: [UIButton]!
    @IBOutlet var Question2Button: [UIButton]!
    @IBOutlet var Question3Button: [UIButton]!
    
    var radioButtonController1: SSRadioButtonsController?
    var radioButtonController2: SSRadioButtonsController?
    var radioButtonController3: SSRadioButtonsController?
    
    var answerScore: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TestQuestionView.layer.cornerRadius = 20
        TestQuestionView.layer.shadowOffset = CGSize(width: 0, height: 2)
        TestQuestionView.layer.shadowOpacity = 0.7
        TestQuestionView.layer.shadowRadius = 5
        TestQuestionView.layer.shadowColor = UIColor(red: 44.0/255.0, green: 62.0/255.0, blue: 80.0/255.0, alpha: 1.0).cgColor
        
        radioButtonController1 = SSRadioButtonsController(buttons: Question1Button)
        radioButtonController2 = SSRadioButtonsController(buttons: Question2Button)
        radioButtonController3 = SSRadioButtonsController(buttons: Question3Button)
        radioButtonController1!.delegate = self
        radioButtonController1!.shouldLetDeSelect = true
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func finishButtonClick(_ sender: UIButton) {
        let tag1 = radioButtonController1?.selectedButton()?.tag
        let tag2 = radioButtonController2?.selectedButton()?.tag
        let tag3 = radioButtonController3?.selectedButton()?.tag
        
        if tag1 != nil && tag2 != nil && tag3 != nil {
            self.performSegue(withIdentifier: "cccadd2ViewController2ResultViewController", sender: sender.tag)
        }
        else {
            let alert = UIAlertController(title: nil, message: "尚未填寫所有選項", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "好的", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! ResultViewController
        var total: Int = 0
        
        answerScore.append((radioButtonController1?.selectedButton()?.tag)!)
        answerScore.append((radioButtonController2?.selectedButton()?.tag)!)
        answerScore.append((radioButtonController3?.selectedButton()?.tag)!)
        
        for score in answerScore {
            total += score
        }
        
        controller.totalScore = total
    }

}
