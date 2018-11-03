//
//  UICollectionGridViewCell.swift
//  QuitCatIsoGame
//
//  Created by Gary on 2018/11/3.
//  Copyright © 2018 Kai Kuma. All rights reserved.
//

import UIKit

class UICollectionGridViewCell: UICollectionViewCell {
    
    //内容标签
    var label:UILabel!
    
    //标签做边距
    var paddingLeft:CGFloat = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //单元格边框
        self.layer.borderWidth = 1
        self.backgroundColor = UIColor.white
        self.clipsToBounds = true
        
        //添加内容标签
        self.label = UILabel(frame: .zero)
        self.label.textAlignment = .center
        self.addSubview(self.label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = CGRect(x: paddingLeft, y: 0,
                             width: frame.width - paddingLeft,
                             height: frame.height)
    }
}
