//
//  PraticeViewController.swift
//  QuitCatIsoGame
//
//  Created by 熊開智 on 2018/10/25.
//  Copyright © 2018 Kai Kuma. All rights reserved.
//

import UIKit

class PraticeViewController: UIViewController {

    @IBOutlet weak var ContentView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        ContentView.layer.cornerRadius = 20
        ContentView.layer.shadowOffset = CGSize(width: 0, height: 2)
        ContentView.layer.shadowOpacity = 0.7
        ContentView.layer.shadowRadius = 5
        ContentView.layer.shadowColor = UIColor(red: 44.0/255.0, green: 62.0/255.0, blue: 80.0/255.0, alpha: 1.0).cgColor
        // Do any additional setup after loading the view.
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
