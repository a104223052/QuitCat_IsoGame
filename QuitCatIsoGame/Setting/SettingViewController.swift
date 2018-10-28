//
//  SettingViewController.swift
//  QuitCatIsoGame
//
//  Created by 熊開智 on 2018/10/28.
//  Copyright © 2018 Kai Kuma. All rights reserved.
//

import UIKit
import Photos

/***
 #database
 1. 頭像編輯完要上傳資料庫
 */

class SettingViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var personalPhotoImage: UIButton!
    @IBOutlet var datePickerView: UIView!
    @IBOutlet weak var timeDatePicker: UIDatePicker!
    @IBOutlet weak var SettingtableView: UITableView!
    
    var img :UIImageView!
    var sheet:UIAlertController!
    var sourceType = UIImagePickerController.SourceType.photoLibrary //將sourceType賦一個初值類型，防止調用時不賦值出現崩潰
    let info: [[String]] = [["每天 8:00 提醒打卡", "每天 8:00 小法規提醒"], ["重新檢測煙癮程度"]]
    var settingTableViewSelector: Int = 0
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return info[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let switchView = UISwitch(frame: CGRect.zero)
        switchView.isOn = true
        cell.textLabel?.text = info[indexPath.section][indexPath.row]

        if indexPath.section == 0 {
            if indexPath.row == 0 {
                switchView.addTarget(self, action: #selector(pushCheckInSwitch), for: UIControl.Event.valueChanged)
            }
            else {
                switchView.addTarget(self, action: #selector(pushKnowledgeSwitch), for: UIControl.Event.valueChanged)
            }
            cell.accessoryView = switchView
        }
        else if indexPath.section == 1 {
            cell.accessoryType = .disclosureIndicator
        }
        
        return cell
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return info.count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let title = section == 0 ? "通知提醒" : "設定吸菸資料"
        return title
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.section == 0 {
            displayDatePickerView(true)
            settingTableViewSelector = indexPath.row == 0 ? 0 : 1
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        personalPhotoImage.layer.cornerRadius = personalPhotoImage.frame.size.width/2
        personalPhotoImage.layer.borderColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        personalPhotoImage.layer.borderWidth = 4
        personalPhotoImage.layer.backgroundColor = UIColor.lightGray.cgColor
        personalPhotoImage.clipsToBounds = true
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        displayDatePickerView(false)
        
        if settingTableViewSelector == 0 {
//            SettingtableView.cellForRow(at: IndexPath.init(row: 0, section: 0))?.textLabel.text = "xxx"
        }
        else {
            
        }
    }
    
    @IBAction func setHeaderImage(_ sender: Any) {
        //判斷設置是否支持圖片庫和相機
        if(UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) && UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary)){
            
            sheet = UIAlertController(title: nil, message: "選擇獲取頭像方式", preferredStyle: .actionSheet)
            
            //取消
            let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: {(action) in
                print("取消")
            })
            sheet.addAction(cancelAction)
            
            
            //相冊
            let OKAction = UIAlertAction(title: "相冊", style: .default, handler: {(action) in
                if(self.PhotoLibraryPermissions() == true){
                    self.sourceType = UIImagePickerController.SourceType.photoLibrary
                    self.open()
                }else{
                    //彈出提示框
                    self.sheet = UIAlertController(title: nil, message: "請在設置中打開相冊權限", preferredStyle: .alert)
                    
                    let tempAction = UIAlertAction(title: "確定", style: .cancel) { (action) in
                        print("取消")
                        
                    }
                    self.sheet.addAction(tempAction)
                    self.present(self.sheet, animated: true, completion: nil)
                }
            })
            sheet.addAction(OKAction)
            
            
            //攝像頭
            let destroyAction = UIAlertAction(title: "攝像頭", style: .default, handler: { (action) in
                if(self.cameraPermissions() == true){
                    self.sourceType = UIImagePickerController.SourceType.camera
                    self.open()
                }else {
                    //彈出提示框
                    self.sheet = UIAlertController(title: nil, message: "請在設置中打開攝像頭權限", preferredStyle: .alert)
                    
                    let tempAction = UIAlertAction(title: "確定", style: .cancel) { (action) in
                    }
                    self.sheet.addAction(tempAction)
                    self.present(self.sheet, animated: true, completion: nil)
                }
            })
            sheet.addAction(destroyAction)
            
        }
        
        self.present(self.sheet, animated: true, completion: nil)
    }
    
    //    打開圖庫或相機
    func open(){
        
        let imagePickerController:UIImagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true//true為拍照、選擇完進入圖片編輯模式
        imagePickerController.sourceType = sourceType
        self.present(imagePickerController, animated: true, completion:{
            
        })
        
    }
    
    /**
     判斷相機權限
     
     - returns: 有權限返回true，沒權限返回false
     */
    func cameraPermissions() -> Bool{
        
        let authStatus:AVAuthorizationStatus = AVCaptureDevice.authorizationStatus(for: AVMediaType.video)
        
        if(authStatus == AVAuthorizationStatus.denied || authStatus == AVAuthorizationStatus.restricted) {
            return false
        }else {
            return true
        }
        
    }
    
    /**
     判斷相冊權限
     
     - returns: 有權限返回ture， 沒權限返回false
     */
    
    func PhotoLibraryPermissions() -> Bool {
        
        let library:PHAuthorizationStatus = PHPhotoLibrary.authorizationStatus()
        if(library == PHAuthorizationStatus.denied || library == PHAuthorizationStatus.restricted){
            return false
        }else {
            return true
        }
    }
    
    //    取消圖片選擇操作
    func imagePickerControllerDidCancel(_ picker:UIImagePickerController)
    {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    //    選擇完圖片操作
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let chosenImage = info[UIImagePickerController.InfoKey.editedImage] as! UIImage //2
        
        personalPhotoImage.setImage(chosenImage, for: .normal) //3
        dismiss(animated:true, completion: nil) //4
    }
    
    @objc func pushCheckInSwitch() {
        print("checkin")
    }
    
    @objc func pushKnowledgeSwitch() {
        print("knowledge")
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
