//
//  UIViewController+AdMob.swift
//  Swimee_AdMob
//
//  Created by 中澤郁斗 on 2016/06/03.
//  Copyright © 2016年 中澤郁斗. All rights reserved.
//

import Foundation
import UIKit
import GoogleMobileAds

var _interstitial: GADInterstitial?//インタースティショナルを呼び出すために必要
extension UIViewController {
    
    
    
    func initAdMobInterstitial(){
        //インタースティショナル広告の初期化
        _interstitial = createAndLoadInterstitial()
    }
    //AdMobのバナー表示
    func addAdmobBanner(){
        
        let AdMobID = "バナーのユニットID入力してください"//AdMobのユニットIDはここに入力！！
        let TEST_DEVICE_ID = "実機でRUNした時に表示されるIDをここに入力してください"//実機にテストバナーを表示させるようのID
        let AdMobTest: Bool = true//広告を表示するかどうか
        let SimulatorTest: Bool = true//シュミレーターの場合はtrue,実機の場合はfalseに設定するとテストバナーが表示されます
        var admobView: GADBannerView = GADBannerView()
        
        /*
         adSizeは様々なサイズを指定できるのできになる人はググってみよう
         */
        admobView = GADBannerView(adSize:kGADAdSizeBanner)
        admobView.frame.origin = CGPointMake(0, self.view.frame.size.height - admobView.frame.height)
        
        admobView.frame.size = CGSizeMake(self.view.frame.width, admobView.frame.height)
        admobView.adUnitID = AdMobID
        admobView.delegate = self as? GADBannerViewDelegate
        admobView.rootViewController = self
        
        let admobRequest: GADRequest = GADRequest()
        
        admobRequest.testDevices = getTestDevices(AdMobTest, SimulatorTest, TEST_DEVICE_ID)
        
        
        admobView.loadRequest(admobRequest)
        
        self.view.addSubview(admobView)
        
    }
    
    /*
     AdMobTest:広告を表示するかどうか
     SimulatorTest:シュミレーターの場合はtrue、実機の場合はfalseに設定するとテストバナーが表示されます
     TEST_DEVICE_ID:実機でRUNした時に表示されるID
     
     */
    func getTestDevices(AdMobTest:Bool, _ SimulatorTest:Bool,_ TEST_DEVICE_ID:String )->[AnyObject]?{
        
        var testDevices:[AnyObject]?
        if AdMobTest {
            
            if SimulatorTest {
                testDevices = [kGADSimulatorID]
            } else {
                testDevices = [TEST_DEVICE_ID]
                
            }
            
        }
        return testDevices
    }
    
    
    //インタースティショナル広告の初期化
    func createAndLoadInterstitial()->GADInterstitial {
        
        let AdMobID = "ca-app-pub-1085053126415712/4970758382"
        let TEST_DEVICE_ID = "実機でRUNした時に表示されるIDをここに入力してください"//実機にテストバナーを表示させるようのID
        
        let AdMobTest: Bool = true//広告を表示するかどうか
        let SimulatorTest: Bool = true//シュミレーターの場合はtrue,実機の場合はfalseに設定するとテストバナーが表示されます
        
        
        let interstitial = GADInterstitial(adUnitID: AdMobID)
        interstitial.delegate = self as? GADInterstitialDelegate
        let gadRequest: GADRequest = GADRequest()
        
        gadRequest.testDevices = getTestDevices(AdMobTest, SimulatorTest, TEST_DEVICE_ID)
        interstitial.loadRequest(gadRequest)
        
        
        return interstitial
    }
    
    //インタースティショナル広告表示
    func presentInterstitial() {
        if let isReady = _interstitial?.isReady {
            _interstitial?.presentFromRootViewController(self)
        }
    }
    
    //インタースティショナル広告を閉じた時に呼ばれる関数
    func interstitialDidDismissScreen(ad: GADInterstitial!) {
        /*
         インタースティショナル広告を閉じた時になんらかの処理をするのはここに書こう!
         */
    }
    
}