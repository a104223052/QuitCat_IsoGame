//
//  EditContactViewController.swift
//  QuitCatIsoGame
//
//  Created by 熊開智 on 2018/10/30.
//  Copyright © 2018 Kai Kuma. All rights reserved.
//

import UIKit

class EditContactViewController: UIViewController {

    @IBOutlet weak var ContentView: UIView!
    @IBOutlet weak var otherTextView: UITextView!
    @IBOutlet var selectDateView: [UIView]!
    @IBOutlet var selectDateLabel: [UILabel]!
    @IBOutlet var datePickerView: UIView!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet var consultationOptionButton: [UIButton]!
    
    var dateSelector = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ContentView.layer.cornerRadius = 20
        ContentView.layer.shadowOffset = CGSize(width: 0, height: 2)
        ContentView.layer.shadowOpacity = 0.7
        ContentView.layer.shadowRadius = 5
        ContentView.layer.shadowColor = UIColor(red: 44.0/255.0, green: 62.0/255.0, blue: 80.0/255.0, alpha: 1.0).cgColor
        
        otherTextView.layer.borderWidth = 1
        otherTextView.layer.cornerRadius = 10
        
        
        for view in selectDateView
        {
            let border = CALayer()
            border.backgroundColor = UIColor.black.cgColor
            border.frame = CGRect(x: 0, y: view.frame.height, width: view.frame.width, height: 1)
            view.layer.addSublayer(border)
        }
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        view.addSubview(datePickerView)
        datePickerView.translatesAutoresizingMaskIntoConstraints = false
        
        datePickerView.heightAnchor.constraint(equalToConstant: 128).isActive = true
        datePickerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        datePickerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        let c = datePickerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 128)
        c.identifier = "pickerViewBottom"
        c.isActive = true
        
        datePickerView.layer.cornerRadius = 10
        
        super.viewWillAppear(animated)
    }
    
    @IBAction func selectConsultationOption(_ sender: UIButton) {
        if sender.currentImage == UIImage(named: "未選取Btn")
        {
            sender.setImage(UIImage(named: "選取Btn"), for: .normal)
        }
        else
        {
            sender.setImage(UIImage(named: "未選取Btn"), for: .normal)
        }
    }
    
    
    func displayDatePickerView(_ show: Bool)
    {
        for c in view.constraints
        {
            if c.identifier == "pickerViewBottom"
            {
                c.constant = (show) ? -40 : 128
                break
            }
        }
        
        UIView.animate(withDuration: 0.5)
        {
            self.view.layoutIfNeeded()
        }
    }
    
    
    @IBAction func addDate(_ sender: UIButton) {
        displayDatePickerView(true)
        
        dateSelector = sender.tag
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        displayDatePickerView(false)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY年MM月dd日 HH:mm"
        if dateSelector != 0{
            for label in selectDateLabel
            {
                if label.tag == dateSelector{
                    
                    label.text = dateFormatter.string(from: datePicker.date)
                }
            }
        }
        dateSelector = 0
    }
    
    @IBAction func submitContact(_ sender: Any) {
        // 建立一個提示框
        let alertController = UIAlertController(
            title: "資料發送成功",
            message: "您的資料已發送至『國民健康署-諮商中心』相關人員會盡快向您聯絡",
            preferredStyle: .alert)
        
        // 建立[確認]按鈕
        let okAction = UIAlertAction(
            title: "好的",
            style: .default,
            handler: {
                (action: UIAlertAction!) -> Void in
                print("按下確認後，閉包裡的動作")
        })
        alertController.addAction(okAction)
        
        
        // 顯示提示框
        self.present(
            alertController,
            animated: true,
            completion: nil)
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
