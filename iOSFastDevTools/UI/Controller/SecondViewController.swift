//
//  SecondViewController.swift
//  iOSFastDevTools
//
//  Created by zcw on 2018/1/2.
//  Copyright © 2018年 zcw. All rights reserved.
//

import UIKit
import SnapKit
class SecondViewController: UIViewController,ParamsProtocol {
    var mytext:String?
    
    func returnparams(tmpstr: String) {
        mytext = tmpstr
        print("SecondViewController:------->value" + mytext!)
        view.backgroundColor = UIColor.red
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let obj = ViewController()
        obj.paramsProtocolDelegate = self
        obj.start()
        
//        print("SecondViewController:------->value" + mytext!)
        // Do any additional setup after loading the view.
        
        
        let ButtonNext = UIButton.init(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
        ButtonNext.setTitle("下一页", for: UIControlState.normal)
        ButtonNext.setTitleColor(UIColor.yellow, for: UIControlState.normal)
        ButtonNext.addTarget(self, action:#selector(nextPage), for: UIControlEvents.touchDown)

        view.addSubview(ButtonNext)
        
        
        let ButtonLast = UIButton.init(frame: CGRect(x: 100, y: 400, width: 200, height: 200))
        ButtonLast.setTitle("上一页", for: UIControlState.normal)
        ButtonLast.setTitleColor(UIColor.yellow, for: UIControlState.normal)
        ButtonLast.addTarget(self, action:#selector(backPage), for: UIControlEvents.touchDown)
        
        view.addSubview(ButtonLast)
        
        
        let photoOptionBtn = UIButton(type:.custom)
        photoOptionBtn.frame = CGRect(x:65,y:150,width:80,height:30);
        photoOptionBtn.backgroundColor = UIColor.orange
        photoOptionBtn.setTitle("测试相机拍照", for: .normal)
        photoOptionBtn.setTitleColor(UIColor.black, for: .normal)
        photoOptionBtn.addTarget(self, action: #selector(goPhoto), for: UIControlEvents.touchDown)
        
        view.addSubview(photoOptionBtn)
        
        photoOptionBtn.snp.makeConstraints { (_ make) in
            //            make.width.equalTo(100)
            //            make.height.equalTo(100)
            //            make.center.equalTo(view)
            make.width.height.equalTo(100)
            make.center.equalToSuperview()
        }
        
    }
    
    @objc func goPhoto() -> () {
        print("跳转页面拍照")
        let controllerPhoto = PictureSelectorViewController()
        present(controllerPhoto, animated: true) {
            print("拍照页面跳转成功")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func nextPage(){
        let sb = UIStoryboard(name: "Main", bundle:nil)
        let vc = sb.instantiateViewController(withIdentifier: "CustomViewController") as! MyViewController
        self.present(vc, animated: true, completion: nil)
    
    }
    
    @objc func backPage(){
        dismiss(animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
