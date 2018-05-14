//
//  MyViewController.swift
//  iOSFastDevTools
//
//  Created by zcw on 2018/1/3.
//  Copyright © 2018年 zcw. All rights reserved.
//

import UIKit
import FontAwesomeKit
class MyViewController: UIViewController {
    
    @IBOutlet var myBtn: UIButton!
    @IBAction func Back(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }
    
    public lazy var btnAFN:UIButton =  UIButton(frame: CGRect(x: 20, y: 100, width: 200, height: 30))
    public lazy var avfoundationBtn:UIButton = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        let familyNames = UIFont.familyNames
        for familyName in familyNames
        {
            print("Family: \(familyName)")
            let fontNames = UIFont.fontNames(forFamilyName: familyName)
            for fontName in fontNames
            {
                print("\tFont:\(fontName)" )
            }
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupUI() {
        FuWenBenDemo()
        btnAFN.setTitle("AFNetworking", for: UIControlState.normal)
        btnAFN.backgroundColor = UIColor.red
        btnAFN.addTarget(self, action: #selector(afnetwordDemo), for: UIControlEvents.touchUpInside)
        self.view.addSubview(btnAFN)
        
        avfoundationBtn.setTitle("AVFoundation", for: UIControlState.normal)
        
        let starIcon: FAKFontAwesome?
        do {
            starIcon = try FAKFontAwesome.init(identifier: "Hiragino Sans", size: 30)
            avfoundationBtn.titleLabel?.attributedText = starIcon?.attributedString()

        } catch let error as NSError {
            print(error.localizedDescription)
        }

        
        avfoundationBtn.addTarget(self, action: #selector(avfoundationBtnAction), for: UIControlEvents.touchUpInside)

        avfoundationBtn.setTitleColor(UIColor.green, for: UIControlState.normal)
        avfoundationBtn.backgroundColor = UIColor.gray
        self.view.addSubview(avfoundationBtn)
        avfoundationBtn.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.view.snp.bottom).offset(-100)
            make.left.equalTo(self.view)
        }
        
    }
    
    func fmdbDemo() -> Void {
        
    }
    
    @objc
    func afnetwordDemo() -> Void {
        OCUtils.testAF()
    }
    
    @objc
    func avfoundationBtnAction() -> Void {
        
        let avf = AVFoundationTestVC()
        self.present(avf, animated: true) {
            
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        SQLiteManager.shareInstance.openDB(name: "demo.sqlite")
        //        let sql = "INSERT INFO T_Person" +
        //        "(name,age) " +
        //        "VALUES " +
        //        "(?,?);"
        
        /// DML
        let sql = "INSERT INTO T_Person \n" +
            "(name, age) \n" +
            "VALUES \n" +
        "(?, ?);"
        //        SQLiteManager.shareInstance.db?.executeUpdate(sql, withArgumentsInArray: nil)
        
        
        do {
            
            
            try SQLiteManager.shareInstance.db?.executeUpdate(sql, values: ["ls",88])
        } catch {
            print("demo lj")
        }
        
        
        
    }
    
    private func FuWenBenDemo() {
        let label = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 300))
        //定义富文本即有格式的字符串
        let attributedStrM : NSMutableAttributedString = NSMutableAttributedString()
        
        //张传靖
        let qiuxuewei : NSAttributedString = NSAttributedString(string: "靖哥哥", attributes: [ NSAttributedStringKey.backgroundColor : UIColor.red,NSAttributedStringKey.foregroundColor : UIColor.green, NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 28.0)])
        //是
        let shi : NSAttributedString = NSAttributedString(string: "是", attributes: [NSAttributedStringKey.foregroundColor : UIColor.blue, NSAttributedStringKey.font : UIFont.systemFont(ofSize: 10.0)])
        //大帅哥
        let dashuaige : NSAttributedString = NSAttributedString(string: "大帅哥", attributes: [NSAttributedStringKey.foregroundColor : UIColor.lightGray, NSAttributedStringKey.font : UIFont.systemFont(ofSize: 42.0)])
        //笑脸图片
        let smileImage : UIImage = UIImage(named: "account_highlight")!
        let textAttachment : NSTextAttachment = NSTextAttachment()
        textAttachment.image = smileImage
        textAttachment.bounds = CGRect(x: 0, y: -4, width: 22, height: 22)
        
        attributedStrM.append(qiuxuewei)
        attributedStrM.append(shi)
        attributedStrM.append(dashuaige)
        attributedStrM.append(NSAttributedString(attachment: textAttachment))
        
        label.attributedText = attributedStrM
        
        self.view.addSubview(label)
    }
    
    
}
