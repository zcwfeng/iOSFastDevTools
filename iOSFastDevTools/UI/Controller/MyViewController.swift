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

        // Do any additional setup after loading the view.
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
