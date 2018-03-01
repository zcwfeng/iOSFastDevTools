//
//  SplashViewController.swift
//  iOSFastDevTools
//
//  Created by zcw on 2018/3/1.
//  Copyright © 2018年 zcw. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
//    var hasSetLanguage:Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        hasSetLanguage = UserDefaults.standard.bool(forKey: "hasSetLanguage")
//        if(hasSetLanguage){
            let window:UIWindow = (UIApplication.shared.delegate?.window!)!
            CYLPlusButtonSubclass.register()
            let vcConfig:CYLTabBarControllerConfig = CYLTabBarControllerConfig()
            window.rootViewController = vcConfig.tabBarController;
        
            
//        } else {
//            self.present(SetLanguageVC(), animated: true) {
//
//            }
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
