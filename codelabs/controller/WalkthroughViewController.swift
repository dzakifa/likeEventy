//
//  WalkthroughViewController.swift
//  codelabs
//
//  Created by dzakifa on 13/08/19.
//  Copyright © 2019 dzakifa. All rights reserved.
//

import UIKit
import CHIPageControl

class WalkthroughViewController: UIViewController, UIPageViewControllerDelegate, WalkthroughPageViewControllerDelegates {
    
    
    func didUpdatePageIndex(currentIndex: Int) {
        
        self.pageControlView.progress = Double(currentIndex)
            
        }
    
    @IBOutlet var pageControlView: CHIPageControlJaloro!
    

    @IBAction func pageControlSlide(_ sender: UIView) {
        
    }
    
    @IBOutlet var nextButton: UIButton! {
        didSet {
            nextButton.layer.cornerRadius = 10.0
            nextButton.layer.masksToBounds = true
        }
    }
    @IBAction func nextButtonTap(_ sender: UIButton) {
        if let index = walkthroughPageViewController?.currentIndex {
            self.pageControlView.progress = Double(index+1)
            switch index {
            case 0...1:
                walkthroughPageViewController?.forwardPage()
                
            case 2:
                UserDefaults.standard.set(true, forKey: "setViewedWalkthrough")
                dismiss(animated: true, completion: nil)
                
            default: break
            }
        }
        
//        updateUI()
    }
    
    @IBOutlet var skipButton: UIButton!
    var walkthroughPageViewController: WalkthroughPageViewController?
    
    @IBAction func skipButtonTap(_ sender: UIButton) {
        UserDefaults.standard.set(true, forKey: "setViewedWalkthrough")
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination
        if let pageViewController = destination as? WalkthroughPageViewController {
            walkthroughPageViewController = pageViewController
            walkthroughPageViewController?.walkthroughDelegate = self
        }
    }


}
