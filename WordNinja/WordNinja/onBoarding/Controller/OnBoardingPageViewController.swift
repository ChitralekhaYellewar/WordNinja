//
//  OnBoardingPageViewController.swift
//  WordNinja
//
//  Created by Chitralekha Yellewar on 10/06/19.
//  Copyright © 2019 Chitralekha Yellewar. All rights reserved.
//

import UIKit

class OnBoardingPageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate, onBoardingProtocol {
    
    var titles = [String]()
    var desc = [String]()
    var images = [String]()
    
    var pageControl = UIPageControl()
    
    var currentPage : OnBoardingPageContentViewController!
    
    var currentPageIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initPageViewData()
        
        self.dataSource = self
        self.delegate = self
        self.currentPage = getViewControllerAtIndex(index: 0)
        self.setViewControllers([getViewControllerAtIndex(index: 0)] as [UIViewController], direction: UIPageViewController.NavigationDirection.forward, animated: false, completion: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        configurePageControl()
    }
    
    func initPageViewData() {
        titles = [Constants.pageOneTitle, Constants.pageTwoTitle]
    }
    
    func configurePageControl() {
        pageControl = UIPageControl(frame: CGRect(x: UIScreen.main.bounds.width / 3,y: UIScreen.main.bounds.maxY - 58,width: UIScreen.main.bounds.width / 3, height: 50))
        
        self.pageControl.numberOfPages = titles.count
        self.pageControl.currentPage = 0
        self.pageControl.alpha = 0.5
        self.pageControl.tintColor = #colorLiteral(red: 0, green: 0.5882352941, blue: 0.8392156863, alpha: 1)
        self.pageControl.pageIndicatorTintColor = #colorLiteral(red: 0, green: 0.6565184593, blue: 0.8709803224, alpha: 0.5)
        self.pageControl.currentPageIndicatorTintColor = #colorLiteral(red: 0, green: 0.5882352941, blue: 0.8392156863, alpha: 1)
        self.pageControl.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(pageControl)
    }
    
}
