//
//  AbstractViewController.swift
//  chooseNumber
//
//  Created by Gustavo Barbosa on 20/06/16.
//  Copyright © 2016 Gustavoopb. All rights reserved.
//

import UIKit
import iAd

class AbstractViewController: UIViewController, ADBannerViewDelegate {
    
    @IBOutlet var adBannerView: ADBannerView?
    
    override func viewDidLoad() {
        self.adBannerView?.delegate = self
        self.adBannerView?.hidden = true
        self.canDisplayBannerAds = true
        super.viewDidLoad()
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.All
    }
    
    func bannerViewWillLoadAd(banner: ADBannerView!) {
        self.adBannerView?.hidden = true
    }
    
    func bannerViewDidLoadAd(banner: ADBannerView!) {
        self.adBannerView?.hidden = false
    }
    
    func bannerViewActionDidFinish(banner: ADBannerView!) {
    }
    
    func bannerViewActionShouldBegin(banner: ADBannerView!, willLeaveApplication willLeave: Bool) -> Bool {
        return true
    }
    
    func bannerView(banner: ADBannerView!, didFailToReceiveAdWithError error: NSError!) {
    }
    
    internal func localizedString(string: String) -> String{
        return NSLocalizedString(string, comment: "")
    }
    
    internal func callStoryboard(storyboardName: String, viewControllerName: String){
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let board = storyboard.instantiateViewControllerWithIdentifier(viewControllerName) as! AbstractViewController
        self.presentViewController(board, animated: true, completion: nil)
    }
}