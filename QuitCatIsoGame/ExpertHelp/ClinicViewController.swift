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
    let nullList = ["123","321 "]
    
    let taipeiList = ["中正區" , "萬華區" , "大同區" , "中山區" , "松山區", "大安區",
                      "信義區" , "內湖區",  "士林區" , "北投區" , "文山區"]
    
    let regionList = [ "萬里區","金山區","板橋區","汐止區","深坑區",
                       "石碇區","瑞芳區","平溪區","雙溪區","貢寮區",
                       "新店區","坪林區","烏來區","永和區","中和區",
                       "土城區","三峽區","樹林區","鶯歌區","三重區",
                       "新莊區","泰山區","林口區","蘆洲區","五股區",
                       "八里區","淡水區","三芝區","石門區"]
    var citySelect = "新北市"
    var regionSelect = ""
    var cityregionSelect = "新北市新店區"
    var isCitySelect:Bool = false
    
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
        gridViewController.setColumns(columns: ["名稱", "電話", "給藥", "衛教" ])
        view.addSubview(gridViewController.view)
        gridViewController.view.removeFromSuperview()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if(isCitySelect == true){
            view.addSubview(regionView)
            regionView.translatesAutoresizingMaskIntoConstraints=false
            regionView.heightAnchor.constraint(equalToConstant: 160).isActive = true
            regionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive=true
            regionView.trailingAnchor.constraint(equalTo: view.trailingAnchor , constant: -10).isActive = true
            let region = regionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 160)
            region.identifier = "bottombottom"
            region.isActive = true
            regionView.layer.cornerRadius = 10
            
        }else{
            view.addSubview(cityView)
            cityView.translatesAutoresizingMaskIntoConstraints = false
            cityView.heightAnchor.constraint(equalToConstant: 128).isActive = true
            cityView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive=true
            cityView.trailingAnchor.constraint(equalTo: view.trailingAnchor , constant: -10).isActive = true
            let city = cityView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 128)
            city.identifier = "bottom"
            city.isActive = true
            cityView.layer.cornerRadius = 10
        }
        super.viewWillAppear(animated)
        
    }
    
    
    @IBAction func showClinic(_ sender: Any) {
        //sessionSimpleDownload()
        
        gridViewController.view.removeFromSuperview()
        
        gridViewController = UICollectionGridViewController()
        
        gridViewController.setColumns(columns: ["名稱", "地圖"  ,"電話", "給藥", "衛教" ])
        gridViewController.setData(nameA: name, phoneA:phone, addressA: address,
                                   administrationA: administration, guardianA: guardian)
        for (index,element) in name.enumerated() {
            gridViewController.addRow(row: [element , "map"  , "phone" , administration[index] , guardian[index]] )
        }
        view.addSubview(gridViewController.view)
    }
    
    override func viewDidLayoutSubviews() {
        gridViewController.view.frame = CGRect(x:0, y:320, width:view.frame.width,
                                               height:400)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    @IBAction func clear(_ sender: Any) {
        gridViewController.view.removeFromSuperview()
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
            if (citySelect == "臺北市"){
                return taipeiList.count
            }else if(citySelect == "新北市"){
                return regionList.count
            }
            return nullList.count
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1 {
            return cityList[row]
        }else{
            if (citySelect == "臺北市"){
                return taipeiList[row]
            }else if(citySelect == "新北市"){
                return regionList[row]
            }
            
            return nullList[row]
        }
    }
    
    
    
    
    @IBAction func downRegionClick(_ sender: Any) {
        var titleRegion = "null"
        if(citySelect == "臺北市"){
            titleRegion = taipeiList[pickerRegionView.selectedRow(inComponent: 0)]
        }else if(citySelect == "新北市"){
            titleRegion = regionList[pickerRegionView.selectedRow(inComponent: 0)]
            
        }
        regionButton.setTitle(titleRegion , for: .normal)
        regionSelect = titleRegion
        cityregionSelect = citySelect + regionSelect
        print(cityregionSelect)
        readcsv( inputAddress: cityregionSelect)
        for items in address{
            print(items)
        }
        isCitySelect = false
        displayPickerRegionView(false)
        regionView.removeFromSuperview()
    }
    
    @IBAction func downClick(_ sender: Any) {
        let titleCity = cityList[pickerCityView.selectedRow(inComponent: 0)]
        cityButton.setTitle(titleCity , for: .normal)
        citySelect = titleCity
        displayPickerCityView(false)
        isCitySelect = true
        cityView.removeFromSuperview()
    }
    
    @IBAction func chooseRegion(_ sender: Any) {
        viewWillAppear(true)
        displayPickerRegionView(true)
    }
    @IBAction func chooseCity(_ sender: Any) {
        viewWillAppear(true)
        displayPickerCityView(true)
    }
    
    
    func displayPickerRegionView(_ show : Bool){
        for c in view.constraints{
            if c.identifier == "bottombottom"{
                c.constant = (show) ? -10 : 160
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
        self.name.removeAll()
        self.phone.removeAll()
        self.address.removeAll()
        self.administration.removeAll()
        self.guardian.removeAll()
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
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        /*
         displayPickerCityView(false)
         displayPickerRegionView(false)
         
         let titleCity = cityList[pickerCityView.selectedRow(inComponent: 0)]
         cityButton.setTitle(titleCity , for: .normal)
         citySelect = titleCity
         
         let titleRegion = regionList[pickerRegionView.selectedRow(inComponent: 0)]
         regionButton.setTitle(titleRegion , for: .normal)
         regionSelect = titleRegion
         cityregionSelect = citySelect + regionSelect
         print(cityregionSelect)
         readcsv( inputAddress: cityregionSelect)
         for items in address{
         print(items)
         }*/
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



