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
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func showSFSafari(_ sender: Any) {
        let url = URL(string: "https://line.me/R/ti/p/6JUjC6n5Zg")!
        if #available(iOS 9.0, *) { //確保是在 iOS9 之後的版本執行
            let safariVC = SFSafariViewController(url: url, entersReaderIfAvailable: false)
            safariVC.delegate = self
            self.present(safariVC, animated: true, completion: nil)
        } else { // iOS 8 以下的話跳出 App 使用 Safari 開啟
            UIApplication.shared.openURL(url)
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
