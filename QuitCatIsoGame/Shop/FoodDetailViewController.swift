//
//  PopopVC.swift
//  QuitCatIsoGame
//
//  Created by Chloe Lee on 2018/11/28.
//  Copyright © 2018 Kai Kuma. All rights reserved.
//

import UIKit


class FoodDetailViewController : UIViewController {
    
    @IBOutlet weak var bgView: UIView!

    @IBOutlet weak var nameLabel: UILabel! //食物名稱
    @IBOutlet weak var bgImageview: UIView! //白框
    @IBOutlet weak var foodImageview: UIImageView! //食物照片
   //@IBOutlet weak var buyFood: UIButton!
    var name: String!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bgView.layer.cornerRadius = 10
        bgView.layer.masksToBounds = true
        
        if name == "普通飼料" {
            foodImageview.image = UIImage(named: "飼料1")
            nameLabel.text = "普通飼料"
            
        } else if name == "貓咪牛奶" {
            foodImageview.image = UIImage(named: "牛奶1")
            nameLabel.text = "貓咪牛奶"
            
        } else if name == "精選飼料"{
            foodImageview.image = UIImage(named: "飼料2")
            nameLabel.text = "精選飼料"
            
        } else if name == "貓咪恢復藥"{
            foodImageview.image = UIImage(named: "藥物")
            nameLabel.text = "貓咪恢復藥"
        }
        
        
    }
    
    @IBAction func buyFoodButton(_ sender: Any){
        
        if name == "普通飼料" {
            let alert = UIAlertController(title: "普通飼料", message: "金額：120", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "確定", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else if name == "貓咪牛奶" {
            
            
        } else if name == "精選飼料"{
            
           
        } else if name == "貓咪恢復藥"{
           
        }
    
    }
    
    
    
    @IBAction func closePopup(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
}



extension UIImage{
    // 重设图片大小
    func scaled(to newSize: CGSize) -> UIImage {
        let rect = CGRect(origin: .zero, size: newSize)
        
        if #available(iOS 10, *) {
            let renderer = UIGraphicsImageRenderer(size: newSize)
            return renderer.image { _ in
                self.draw(in: rect)
            }
        } else {
            UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
            self.draw(in: rect)
            let newImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return newImage!
        }
    }

    
}
