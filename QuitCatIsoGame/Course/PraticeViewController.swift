//
//  PraticeViewController.swift
//  QuitCatIsoGame
//
//  Created by 熊開智 on 2018/10/25.
//  Copyright © 2018 Kai Kuma. All rights reserved.
//



import UIKit

/***
 database
 1. 完成測驗上傳資料庫
 */


class PraticeViewController: UIViewController, SSRadioButtonControllerDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var ContentView: UIView!
    @IBOutlet weak var Question1View: UIView!
    @IBOutlet var Question1Button: [UIButton]!
//    @IBOutlet var Question2Button: [UIButton]!
//    @IBOutlet var Question3Button: [UIButton]!
    
    var radioButtonController1: SSRadioButtonsController?//cp this
    var radioButtonController2: SSRadioButtonsController?
    var radioButtonController3: SSRadioButtonsController?
    
    var questionArray: [[String]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ContentView.layer.cornerRadius = 20
        ContentView.layer.shadowOffset = CGSize(width: 0, height: 2)
        ContentView.layer.shadowOpacity = 0.7
        ContentView.layer.shadowRadius = 5
        ContentView.layer.shadowColor = UIColor(red: 44.0/255.0, green: 62.0/255.0, blue: 80.0/255.0, alpha: 1.0).cgColor
        
        questionArray = [["吸菸所造成傷害，何者為是？","4","(A)皮膚系統", "(B)血管組織", "(C)呼吸系統", "(D)以上皆是"], ["吸菸會造成依賴感嗎？","1","(A)會", "(B)不會", "(C)不知道", "(D)不一定"], ["成人如暴露二手菸中，會有那些症狀？","4","(A)頭痛、頭暈不適", "(B)增加心臟疾病", "(C)長期曝露二手菸下會增加10-30％肺癌機率", "(D)以上皆是"]]
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
//        radioButtonController1 = SSRadioButtonsController(buttons: Question1Button)//cp this
//        radioButtonController2 = SSRadioButtonsController(buttons: Question2Button)
//        radioButtonController3 = SSRadioButtonsController(buttons: Question3Button)
//        radioButtonController1!.delegate = self//cp this
//        radioButtonController1!.shouldLetDeSelect = true//cp this
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "CourseTableViewCell";
        
        var cell:CourseTableViewCell? = tableView.dequeueReusableCell(withIdentifier: identifier) as? CourseTableViewCell;
        if(cell == nil){
            cell = CourseTableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: identifier);
        }
        
        //indexPath.row 可以知道目前是要製作第幾列的view
        cell?.questionLabel?.text = "Q" + String(indexPath.row + 1) + ":" + questionArray[indexPath.row][0]
        cell?.questionButtonArray[0].setTitle(questionArray[indexPath.row][2], for: .normal)
        cell?.questionButtonArray[1].setTitle(questionArray[indexPath.row][3], for: .normal)
        cell?.questionButtonArray[2].setTitle(questionArray[indexPath.row][4], for: .normal)
        cell?.questionButtonArray[3].setTitle(questionArray[indexPath.row][5], for: .normal)
        
        //依據是第幾個row決定icon的圖片
        //        switch indexPath.row{
        //        case 0:
        //            cell?.imgIcon.image = UIImage(named: "icon-factory");
        //            break;
        //        case 1:
        //            cell?.imgIcon.image = UIImage(named: "icon-location");
        //            break;
        //        case 2:
        //            cell?.imgIcon.image = UIImage(named: "icon-money");
        //            break;
        //        default:
        //            break;
        //        }
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func didSelectButton(selectedButton: UIButton?) {
        
    }
    
    @IBAction func back(_ sender: Any) {
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

