//
//  ViewController.swift
//  QuitCatIsoGame
//
//  Created by Gary on 2018/11/3.
//  Copyright © 2018 Kai Kuma. All rights reserved.
//

import UIKit
import CSVImporter


class ClinicViewController: UIViewController , UIPickerViewDataSource , UIPickerViewDelegate {
    
    var gridViewController: UICollectionGridViewController!
    var local_localtion:String = ""
    var name = [String]()
    var phone = [String]()
    var address = [String]()
    var administration = [String]()
    var guardian = [String]()
    
    let cityList = ["臺北市" , "新北市" , "桃園市" , "新竹市" , "苗栗縣"  , "台中市"  ]
    let regionList = ["新店區" , "永和區" , "萬里區" , "金山區" , "板橋區"  , "瑞芳區"]
    var citySelect = "新北市"
    var regionSelect = "新店區"
    var cityregionSelect = "新北市新店區"
    
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var regionButton: UIButton!
    @IBOutlet weak var cityButton: UIButton!
    @IBOutlet weak var pickerRegionView: UIPickerView!
    @IBOutlet weak var pickerCityView: UIPickerView!
    @IBOutlet var cityView: UIView!
    @IBOutlet var regionView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sessionSimpleDownload()
        
        gridViewController = UICollectionGridViewController()
        gridViewController.setColumns(columns: ["名稱", "地址", "電話", "給藥", "衛教" ])
        view.addSubview(gridViewController.view)
        
 
    }
    
    override func viewWillAppear(_ animated: Bool) {
        view.addSubview(cityView)
        view.addSubview(regionView)
        cityView.translatesAutoresizingMaskIntoConstraints = false
        regionView.translatesAutoresizingMaskIntoConstraints=false
        cityView.heightAnchor.constraint(equalToConstant: 128).isActive = true
        regionView.heightAnchor.constraint(equalToConstant: 128).isActive = true
        
        cityView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive=true
        regionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive=true
        
        cityView.trailingAnchor.constraint(equalTo: view.trailingAnchor , constant: -10).isActive = true
        regionView.trailingAnchor.constraint(equalTo: view.trailingAnchor , constant: -10).isActive = true

        let city = cityView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 128)
        let region = regionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 128)
        
        city.identifier = "bottom"
        region.identifier = "bottombottom"
        
        city.isActive = true
        region.isActive = true
        
        cityView.layer.cornerRadius = 10
        regionView.layer.cornerRadius = 10
        
        super.viewWillAppear(animated)
        
    }
    
    
    @IBAction func showClinic(_ sender: Any) {
        sessionSimpleDownload()
        gridViewController = UICollectionGridViewController()
        gridViewController.setColumns(columns: ["名稱", "地址", "電話", "給藥", "衛教" ])
        for (index,element) in name.enumerated() {
            gridViewController.addRow(row: [element, address[index] , phone[index] , administration[index] , guardian[index]] )
        }
        /*
        gridViewController.addRow(row: ["hangge", "100", "8", "60%"])
        gridViewController.addRow(row: ["张三", "223", "16", "81%"])
        gridViewController.addRow(row: ["李四", "143", "25", "93%"])
        gridViewController.addRow(row: ["王五", "75", "2", "53%"])
        gridViewController.addRow(row: ["韩梅梅", "43", "12", "33%"])
        gridViewController.addRow(row: ["李雷", "33", "27", "45%"])
        gridViewController.addRow(row: ["王大力", "33", "22", "15%"])*/
        view.addSubview(gridViewController.view)
    }
     override func viewDidLayoutSubviews() {
     gridViewController.view.frame = CGRect(x:0, y:320, width:view.frame.width,
     height:400)
     }
     override func didReceiveMemoryWarning() {
     super.didReceiveMemoryWarning()
     }
    
    
    
    
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if pickerView.tag == 1{
            return 1
        }else{
            return 1
        }
        
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1{
            return cityList.count
        }else{
            return regionList.count
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1 {
            return cityList[row]
        }else{
            return regionList[row]
        }
    }
    
    
    
    
    @IBAction func downRegionClick(_ sender: Any) {
        let titleRegion = regionList[pickerRegionView.selectedRow(inComponent: 0)]
        regionButton.setTitle(titleRegion , for: .normal)
        regionSelect = titleRegion
        cityregionSelect = citySelect + regionSelect
        readcsv( inputAddress: cityregionSelect)
        for items in address{
            print(items)
        }
        displayPickerRegionView(false)
    }
    
    @IBAction func downClick(_ sender: Any) {
        let titleCity = cityList[pickerCityView.selectedRow(inComponent: 0)]
        cityButton.setTitle(titleCity , for: .normal)
        citySelect = titleCity
        
        displayPickerCityView(false)
    }
    
    @IBAction func chooseRegion(_ sender: Any) {
        displayPickerRegionView(true)

    }
    @IBAction func chooseCity(_ sender: Any) {
        displayPickerCityView(true)
    }
    
    
    
    
    func displayPickerRegionView(_ show : Bool){
        for c in view.constraints{
            if c.identifier == "bottombottom"{
                c.constant = (show) ? -10 : 128
                break
            }
        }
        UIView.animate(withDuration: 0.5){
            self.view.layoutIfNeeded()
        }
    }
    func displayPickerCityView(_ show : Bool){
        for c in view.constraints{
            if c.identifier == "bottom"{
                c.constant = (show) ? -10 : 128
                break
            }
        }
        UIView.animate(withDuration: 0.5){
            self.view.layoutIfNeeded()
        }
    }
    func readcsv(inputAddress:String) {
        let path = local_localtion
        let importer = CSVImporter<[String]>(path: path)
        importer.startImportingRecords { $0 }.onFinish { importedRecords in
            for record in importedRecords {
                if(record[4].contains(find: inputAddress)){
                    self.name.append(record[1])
                    self.phone.append(record[2])
                    self.address.append(record[4])
                    self.administration.append(record[5])
                    self.guardian.append(record[6])
                }
            }
        }
    }
    func sessionSimpleDownload(){
        let url = URL(string: "https://drive.google.com/uc?export=download&confirm=jeak&id=1duW_cKqUCk7p1t9Lv_4pVFGDCEAvlY-u")
        let request = URLRequest(url: url!)
        let session = URLSession.shared
        let downloadTask = session.downloadTask(with: request,completionHandler: { (location:URL?, response:URLResponse?, error:Error?) -> Void in
            let locationPath = location!.path
            let documnets:String = NSHomeDirectory() + "/Documents/opendata.csv"
            //创建文件管理
            let fileManager = FileManager.default
            let myDirectory = NSHomeDirectory() + "/Documents/"
            let fileArray = fileManager.subpaths(atPath: myDirectory)
            for fn in fileArray!{
                try! fileManager.removeItem(atPath: myDirectory + "/\(fn)")
            }
            let exist = fileManager.fileExists(atPath: documnets)
            if(exist == false){
                try! fileManager.moveItem(atPath: locationPath, toPath: documnets)
                print("new location:\(documnets)")
                self.local_localtion = documnets
            }else{
                try! fileManager.removeItem(atPath: documnets)
                try! fileManager.moveItem(atPath: locationPath, toPath: documnets)
                print("new location:\(documnets)")
                self.local_localtion = documnets
            }
        })
        //使用resume方法启动任务
        downloadTask.resume()
    }
}
extension String {
    func contains(find: String) -> Bool{
        return self.range(of: find) != nil
    }
    func containsIgnoringCase(find: String) -> Bool{
        return self.range(of: find, options: .caseInsensitive) != nil
    }
}


