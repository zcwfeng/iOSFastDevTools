//
//  AVFoundationTestVC.swift
//  iOSFastDevTools
//
//  Created by zcw on 2018/5/14.
//  Copyright © 2018年 zcw. All rights reserved.
//

import UIKit
import FontAwesomeKit
class AVFoundationTestVC: UIViewController {
    public lazy var testNormalVoice:UIButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        let cogIcon = FAKFontAwesome.cogIcon(withSize: 20)
        cogIcon?.addAttribute(NSAttributedStringKey.foregroundColor.rawValue, value: UIColor.red)
        let leftImage = cogIcon?.image(with: CGSize(width: 20, height: 20))
        cogIcon?.iconFontSize = 50
        let leftLandscapeImage = cogIcon?.image(with: CGSize(width: 15, height: 15))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: leftImage,
            landscapeImagePhone: leftLandscapeImage,
            style: .plain,
            target: nil,
            action: nil)
        
        let backBtn : UIButton = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 50, height: 28))
        backBtn.setImage(UIImage.init(named: "back_icon"), for: UIControlState.normal)
        backBtn.tintColor = UIColor.white
        backBtn.titleColor(for: UIControlState.normal)
        backBtn.addTarget(self, action: #selector(back(_:)), for: UIControlEvents.touchUpInside)
        view.addSubview(backBtn)
        
        backBtn.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp.top).offset(44)
            make.width.equalTo(50)
            make.height.equalTo(28)
        }
        
        
        
        testNormalVoice.setTitle("testAVFoundationVoice", for: UIControlState.normal)
        testNormalVoice.addTarget(self, action: #selector(testAVFoundationVoice), for: UIControlEvents.touchUpInside)

        testNormalVoice.setTitleColor(UIColor.green, for: UIControlState.normal)
        testNormalVoice.backgroundColor = UIColor.gray
        self.view.addSubview(testNormalVoice)
        testNormalVoice.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.snp.top).offset(100)
            make.left.equalTo(self.view)
        }
        
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func back(_ sender: UIButton) {
        if self.navigationController != nil {
            self.navigationController?.popViewController(animated: true)
        }else {
            self.dismiss(animated: false) {
                
            }
        }
    }
    
    @objc func testAVFoundationVoice(_ sender: UIButton) {
        AVPlayerManager.sharedPlayerManager.playSound(soundText: "I am Chinese")

    }
   

}
