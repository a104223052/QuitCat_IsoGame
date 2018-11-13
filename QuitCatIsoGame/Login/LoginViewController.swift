//
//  LoginViewController.swift
//  QuitCatIsoGame
//
//  Created by 熊開智 on 2018/10/24.
//  Copyright © 2018 Kai Kuma. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import Firebase



class LoginViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        contentView.layer.cornerRadius = 25
        // Do any additional setup after loading the view.
    }
    
    var delegate: getUserIDDelegate?
    var userID = ""
    
    //Login to Facebook by btn
    @IBAction func onClickLoginWithFacebook(_ sender: Any) {
        let fbLoginManager = FBSDKLoginManager()
        // 使用FB登入的SDK，並請求可以讀取用戶的基本資料和取得用戶email的權限
        fbLoginManager.logOut()
        fbLoginManager.logIn(withReadPermissions: ["public_profile", "email"], from: self) { (result, error) in
            
            // 登入失敗
            if error != nil {
                print("Failed to login: \(error?.localizedDescription)")
                return
            }
            // 取得登入者的token失敗敗
            if FBSDKAccessToken.current() == nil {
                print("Failed to get access token")
                return
            }
            
            print("tokenString: \(FBSDKAccessToken.current().tokenString)")
            
            // 擷取用戶的access token，並通過調用將其轉換為Firebase的憑證
            let credential = FacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
            
            // 呼叫Firebase的API處理登入的動作
            Auth.auth().signIn(with: credential, completion: { (user, error) in
                if error != nil {
                    print((error?.localizedDescription)!)
                    return
                }
                // 使用FB登入成功
                print("使用FB登入成功")
                let user = Auth.auth().currentUser
                if let user = user{
                    self.userID = user.uid
                    //UID 需在每個畫面都有
                }
                
                
                let switchPages = SwitchPages()
                switchPages.switchFromRight(viewControllew: self)
//                switchPages.switchPagesByPresent(viewController: self, ID: "InformationSettingViewController")
                
                if let controller = self.storyboard?.instantiateViewController(withIdentifier: ID) {
                    self.present(controller, animated: false, completion: nil)
                    self.delegate = controller as! getUserIDDelegate
                    self.delegate?.getUserID(self.userID)
                }
                
            })
            
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller. //把sender傳遞過來的資料強制轉型成UIButton的型態
    }
     */

}
