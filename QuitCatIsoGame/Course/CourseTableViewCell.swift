//
//  CourseTableViewCell.swift
//  QuitCatIsoGame
//
//  Created by 熊開智 on 2018/11/26.
//  Copyright © 2018 Kai Kuma. All rights reserved.
//

import Foundation
import UIKit
public class CourseTableViewCell:UITableViewCell, SSRadioButtonControllerDelegate{
    
    var radioButtonController: SSRadioButtonsController?//cp this
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet var questionButtonArray: [UIButton]!
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    //繼承UITableViewCell一定要override的function
    public required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    func didSelectButton(selectedButton: UIButton?) {
        
    }
}
