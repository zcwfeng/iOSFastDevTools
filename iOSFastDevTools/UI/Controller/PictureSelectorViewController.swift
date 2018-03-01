//
//  PictureSelectorViewController.swift
//  iOSFastDevTools
//
//  Created by zcw on 2018/1/12.
//  Copyright © 2018年 zcw. All rights reserved.
//

import UIKit

class PictureSelectorViewController: UIViewController,UIAlertViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    let picker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.blue
        
//        self.navigationController?.setNavigationBarHidden(true, animated: true)

        initializePhotoPicker()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func initializePhotoPicker(){
        picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        picker.delegate = self
        picker.navigationBar.tintColor = UIColor.white
        picker.navigationBar.titleTextAttributes?.updateValue(UIColor.white, forKey: NSAttributedStringKey.foregroundColor)
        picker.navigationBar.barTintColor = UIColor.init(red: 42.0/255.0, green: 49.0/255.0, blue: 50.0/255.0, alpha: 1.0)
        picker.navigationBar.isTranslucent = false
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
