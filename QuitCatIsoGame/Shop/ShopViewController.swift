//
//  ShopViewController.swift
//  QuitCatIsoGame
//
//  Created by Chloe Lee on 2018/11/20.
//  Copyright © 2018 Kai Kuma. All rights reserved.
//
import UIKit
import ImageIO


class ShopViewController: UIViewController {
    
    
    
   //let eggGif = UIImage.gifImageWithName("gif4")
    let imageView = UIImageView(frame: CGRect(x: 27, y: 59, width: 313, height: 456))
    
    @IBOutlet weak var foodButton: UIButton!
    @IBOutlet weak var furnitureButton: UIButton!
    @IBOutlet weak var bgButton: UIButton!
    var selectedButton: UIButton!
    
    @IBOutlet weak var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedButton = foodButton
        selectedViewController = foodViewController
        
    }
    
    @IBAction func showFoodpage(_ sender: Any) {
         changeTab(to: foodButton)
         changePage(to: foodViewController)
        
    }
    
    @IBAction func showFurniturepage(_ sender: Any) {
         changeTab(to: furnitureButton)
         changePage(to: furnitureViewController)
         //eggGif.loadGif(name: "gif4")
   
        
    }
   
    @IBAction func showBgpage(_ sender: Any) {
         changeTab(to: bgButton)
         changePage(to: bgViewController)
    }
    
    var foodViewController : FoodViewController!
    
    lazy var bgViewController : BgViewController = {
        self.storyboard!.instantiateViewController(withIdentifier : "bgPage" ) as! BgViewController
    }()
    
    lazy var furnitureViewController : FurnitureViewController = {
        self.storyboard!.instantiateViewController(withIdentifier : "furniturePage" ) as! FurnitureViewController
    }()
    
    var selectedViewController: UIViewController!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ContainerViewSegue" {
            foodViewController = segue.destination as! FoodViewController
        }
    }
    
    func changeTab(to newButton: UIButton) {
        // 先利用 tintColor 取得 Button 預設的文字顏色
        _ = selectedButton.tintColor
        // 未選取顏色
        selectedButton.backgroundColor = UIColor(named: "shopColor-淺卡其")
        selectedButton.setTitleColor(UIColor(named: "shopColor-咖啡色"), for: .normal)
        // 選取的顏色
        newButton.backgroundColor = UIColor(named: "shopColor-咖啡色") 
        newButton.setTitleColor(UIColor(named: "shopColor-淺卡其"), for: .normal)
        // 改為新的按鈕
        selectedButton = newButton
    }
   
    func changePage(to newViewController: UIViewController) {
        // 2. Remove previous viewController
        selectedViewController.willMove(toParent: nil)
        selectedViewController.view.removeFromSuperview()
        selectedViewController.removeFromParent()
        
        // 3. Add new viewController
        addChild(newViewController)
        self.containerView.addSubview(newViewController.view)
        newViewController.view.frame = containerView.bounds
        newViewController.didMove(toParent: self)
        
        // 4.
        self.selectedViewController = newViewController
    
    }
    

}
