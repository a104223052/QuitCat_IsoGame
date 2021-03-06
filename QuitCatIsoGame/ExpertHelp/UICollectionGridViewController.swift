//
//  UICollectionGridViewController.swift
//  QuitCatIsoGame
//
//  Created by Gary on 2018/11/2.
//  Copyright © 2018 Kai Kuma. All rights reserved.
//

import Foundation
import UIKit
import MapKit

//多列表格组件（通过CollectionView实现）
class UICollectionGridViewController: UICollectionViewController {
    //表头数据
    var cols: [String]! = []
    //行数据
    var rows: [[Any]]! = []
    //单元格内容居左时的左侧内边距
    var name = [String]()
    var phone = [String]()
    var address = [String]()
    var administration = [String]()
    var guardian = [String]()
    
    
    
    private var cellPaddingLeft:CGFloat = 5
    
    init() {
        //初始化表格布局
        let layout = UICollectionGridViewLayout()
        super.init(collectionViewLayout: layout)
        layout.viewController = self
        collectionView!.backgroundColor = UIColor.white
        collectionView!.register(UICollectionGridViewCell.self,
                                 forCellWithReuseIdentifier: "cell")
        collectionView!.delegate = self
        collectionView!.dataSource = self
        collectionView!.isDirectionalLockEnabled = true
        collectionView!.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        collectionView!.bounces = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("UICollectionGridViewController.init(coder:) has not been implemented")
    }
    
    //设置列头数据
    func setColumns(columns: [String]) {
        cols = columns
    }
    
    func setData(nameA:[String] , phoneA:[String] , addressA:[String] , administrationA:[String] ,  guardianA:[String] ){
        name.removeAll()
        phone.removeAll()
        address.removeAll()
        administration.removeAll()
        guardian.removeAll()
        name = nameA
        phone = phoneA
        address = addressA
        administration = administrationA
        guardian = guardianA
    }
    
    //添加行数据
    func addRow(row: [Any]) {
        rows.append(row)
        collectionView!.collectionViewLayout.invalidateLayout()
        collectionView!.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        collectionView!.frame = CGRect(x:0, y:0,
                                       width:view.frame.width, height:view.frame.height)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //返回表格总行数
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        if cols.isEmpty {
            return 0
        }
        //总行数是：记录数＋1个表头
        return rows.count + 1
    }
    
    //返回表格的列数
    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        return cols.count
    }
    
    //单元格内容创建
    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell",
                                                      for: indexPath) as! UICollectionGridViewCell
        //第一列的内容左对齐，其它列内容居中
        if indexPath.row == 0 {
            cell.label.textAlignment = .left
            cell.paddingLeft = cellPaddingLeft
        }
        
        //设置列头单元格，内容单元格的数据
        if indexPath.section == 0 {
            let text = NSAttributedString(string: cols[indexPath.row], attributes: [
                NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 15)
                ])
            cell.label.attributedText = text
        } else {
            cell.label.font = UIFont.systemFont(ofSize: 15)
            cell.label.text = "\(rows[indexPath.section-1][indexPath.row])"
        }
        
        return cell
    }
    
    func beginNav(_ startPlacemark: CLPlacemark, endPlacemark: CLPlacemark) {
        let startP: MKPlacemark = MKPlacemark(placemark: startPlacemark)
        let startItem: MKMapItem = MKMapItem(placemark: startP)
        let endP: MKPlacemark = MKPlacemark(placemark: endPlacemark)
        let endItem: MKMapItem = MKMapItem(placemark: endP)
        let mapItems: [MKMapItem] = [startItem, endItem]// 起点和终点
        let dic: [String : Any] = [// 导航设置字典
            MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving,// 导航模式
            MKLaunchOptionsMapTypeKey: MKMapType.standard.rawValue,// 地图样式
            MKLaunchOptionsShowsTrafficKey: true// 显示交通
        ]
        MKMapItem.openMaps(with: mapItems, launchOptions: dic)
    }
    
    lazy var geoCoder: CLGeocoder = {
        return CLGeocoder()
    }()
    
    //单元格选中事件
    override func collectionView(_ collectionView: UICollectionView,
                                 didSelectItemAt indexPath: IndexPath) {
        //打印出点击单元格的［行,列］坐标
        print("点击单元格的[行,列]坐标: [\(indexPath.section),\(indexPath.row)]")
        
        if(indexPath.row == 1){
            var addressString:String = address[(indexPath.section)-1]
            geoCoder.geocodeAddressString("世新大學") { (pls: [CLPlacemark]?, error) -> Void in
                let shPlacemark = pls?.first
                self.geoCoder.geocodeAddressString(addressString) { (pls: [CLPlacemark]?, error) -> Void in
                    let bjPlacemark = pls?.first
                    self.beginNav(shPlacemark!, endPlacemark: bjPlacemark!)
                }
            }
        }else if(indexPath.row == 2){
            let number:String = phone[(indexPath.section)-1]
            let result = number.replacingOccurrences(of: "-", with: "",
                                                     options: NSString.CompareOptions.literal, range:nil)
            let secondresuld = result.replacingOccurrences(of: " ", with: "",
                                                           options: NSString.CompareOptions.literal, range:nil)
            if let url = URL(string: "tel://"+secondresuld ) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
        print(name[(indexPath.section)-1])
        
    }
}
