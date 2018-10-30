//
//  ExpertHelpViewController.swift
//  QuitCatIsoGame
//
//  Created by 熊開智 on 2018/10/24.
//  Copyright © 2018 Kai Kuma. All rights reserved.
//

import UIKit
import SafariServices

class ExpertHelpViewController: UIViewController, SFSafariViewControllerDelegate {

    @IBOutlet var OptionViewCollection: [UIView]!
    override func viewDidLoad() {
        super.viewDidLoad()

        for view in OptionViewCollection
        {
            view.layer.shadowOffset = CGSize(width: 0, height: 2)
            view.layer.shadowOpacity = 0.7
            view.layer.shadowRadius = 5
            view.layer.shadowColor = UIColor(red: 44.0/255.0, green: 62.0/255.0, blue: 80.0/255.0, alpha: 1.0).cgColor
            view.layer.cornerRadius = 5
            
            view.isUserInteractionEnabled = true
            
            
            switch view.tag
            {
            case 0:
                break
            case 1:
                break
            case 2:
                break
            case 3:
                break
            default:
                break
            }
        }
        // Do any additional setup after loading the view.
    }
    
    @objc func showSFSafari() {
        let url = URL(string: "https://line.me/R/ti/p/6JUjC6n5Zg")!
        if #available(iOS 9.0, *) { //確保是在 iOS9 之後的版本執行
            let safariVC = SFSafariViewController(url: url, entersReaderIfAvailable: false)
            safariVC.delegate = self
            self.present(safariVC, animated: true, completion: nil)
        } else { // iOS 8 以下的話跳出 App 使用 Safari 開啟
            UIApplication.shared.openURL(url)
        }
    }
    @IBAction func showLINE(_ sender: Any) {
        let url = URL(string: "https://line.me/R/ti/p/6JUjC6n5Zg")!
        if #available(iOS 9.0, *) { //確保是在 iOS9 之後的版本執行
            let safariVC = SFSafariViewController(url: url, entersReaderIfAvailable: false)
            safariVC.delegate = self
            self.present(safariVC, animated: true, completion: nil)
        } else { // iOS 8 以下的話跳出 App 使用 Safari 開啟
            UIApplication.shared.openURL(url)
        }
    }
    
    @IBAction func showQuittingLine(_ sender: Any) {
        let viewController = EditContactViewController()
        
        // 建立一個提示框
        let alertController = UIAlertController(
            title: "填寫資料",
            message: "將由『國民健康署-諮商中心』在您方便的時間聯絡您",
            preferredStyle: .alert)
        
        // 建立[確認]按鈕
        let okAction = UIAlertAction(
            title: "同意並填寫資料",
            style: .default,
            handler: {
                (action: UIAlertAction!) -> Void in
                self.performSegue(withIdentifier: "expert.push.edit", sender: self)
        })
        alertController.addAction(okAction)
        
        let cancelAction = UIAlertAction(
            title: "再想想",
            style: .cancel,
            handler: nil)
        alertController.addAction(cancelAction)
        
        // 顯示提示框
        self.present(
            alertController,
            animated: true,
            completion: nil)
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
