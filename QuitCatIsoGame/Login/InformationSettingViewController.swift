//
//  InformationSettingViewController.swift
//  QuitCatIsoGame
//
//  Created by 熊開智 on 2018/10/21.
//  Copyright © 2018 Kai Kuma. All rights reserved.
//

import UIKit
import Photos

class InformationSettingViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIActionSheetDelegate {

    @IBOutlet weak var PersonalPhotoImage: UIButton!
    
    var img :UIImageView!
    var sheet:UIAlertController!
    var sourceType = UIImagePickerController.SourceType.photoLibrary //將sourceType賦一個初值類型，防止調用時不賦值出現崩潰
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PersonalPhotoImage.layer.cornerRadius = PersonalPhotoImage.frame.size.width/2
        PersonalPhotoImage.layer.borderColor = UIColor.init(red: 83/255, green: 120/255, blue: 158/255, alpha: 1).cgColor
        PersonalPhotoImage.layer.borderWidth = 4
        PersonalPhotoImage.clipsToBounds = true
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
        
        PersonalPhotoImage.setImage(chosenImage, for: .normal) //3
        dismiss(animated:true, completion: nil) //4
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
