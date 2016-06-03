//
//  ViewController.swift
//  Swimee_AdMob
//
//  Created by 中澤郁斗 on 2016/05/23.
//  Copyright © 2016年 中澤郁斗. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ViewController: UIViewController, GADBannerViewDelegate, GADInterstitialDelegate {
    
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func tapped(){
        presentInterstitial()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
        
}
