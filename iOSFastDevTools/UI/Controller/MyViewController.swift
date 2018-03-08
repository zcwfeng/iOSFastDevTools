//
//  MyViewController.swift
//  iOSFastDevTools
//
//  Created by zcw on 2018/1/3.
//  Copyright © 2018年 zcw. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {
    
    @IBOutlet var myBtn: UIButton!
    @IBAction func Back(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FuWenBenDemo()    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func FuWenBenDemo() {
        let label = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 300))
        //定义富文本即有格式的字符串
        let attributedStrM : NSMutableAttributedString = NSMutableAttributedString()
        
        //张传靖
        let qiuxuewei : NSAttributedString = NSAttributedString(string: "张传靖", attributes: [ NSAttributedStringKey.backgroundColor : UIColor.red,NSAttributedStringKey.foregroundColor : UIColor.green, NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 28.0)])
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
