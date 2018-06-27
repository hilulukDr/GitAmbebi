//
//  TabBarControler.swift
//  ff
//
//  Created by iMac on 6/7/18.
//  Copyright © 2018 iMac. All rights reserved.
//

import UIKit

class TabBarControler: UITabBarController {

    @IBOutlet weak var tabitem: UITabBar!
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidLayoutSubviews()
    {
        tabBar.frame = CGRectMake(0,0,UIScreen.main.bounds.width,50)
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
