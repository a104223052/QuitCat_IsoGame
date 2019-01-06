//
//  FoodViewController.swift
//  QuitCatIsoGame
//
//  Created by Chloe Lee on 2018/11/24.
//  Copyright © 2018 Kai Kuma. All rights reserved.
//

import UIKit

class FoodViewController: UIViewController {

    @IBOutlet weak var foodContainerView: UIView!
    @IBOutlet weak var food1label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        //foodCheckContainerView.isHidden = true
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func food1Button(_ sender: Any) {
        
  
    }
    @IBAction func food2Button(_ sender: Any) {
    }
    
    @IBAction func food3Button(_ sender: Any) {
    }
    
    @IBAction func food4Button(_ sender: Any) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender:
        Any?) {
        let button = sender as! UIButton //把sender傳遞過來的資料強制轉型成UIButton的型態
        //let label = sender as! UILabel
        let controller = segue.destination as! FoodDetailViewController
        //把segue.destination強制轉型成detailViewController
        controller.name = button.currentTitle //把按鈕上的名字傳過去
        controller.foodImageview = button.imageView
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
