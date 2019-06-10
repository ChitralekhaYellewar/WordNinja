//
//  OnBoardingUIPageViewController.swift
//  WordNinja
//
//  Created by Chitralekha Yellewar on 10/06/19.
//  Copyright © 2019 Chitralekha Yellewar. All rights reserved.
//

import UIKit

extension OnBoardingPageViewController {
    // MARK: Delegate functions
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        let pageContentViewController = pageViewController.viewControllers![0] as! OnBoardingPageContentViewController
        self.pageControl.currentPage =  pageContentViewController.pageIndex
        
        self.pageControl.subviews.forEach { $0.transform = CGAffineTransform(scaleX: 1, y: 1) }
        self.pageControl.subviews[self.pageControl.currentPage].transform = CGAffineTransform(scaleX: 1.25, y: 1.25)
        
        
        if(self.pageControl.currentPage == titles.count - 1) {
            self.pageControl.removeFromSuperview()
            pageContentViewController.onBoardingView.getStartedButton.isHidden = false
        } else {
            self.view.addSubview(pageControl)
            self.view.layoutIfNeeded()
        }
        
        updateUI()
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let pageContent: OnBoardingPageContentViewController = viewController as! OnBoardingPageContentViewController
        
        var index = pageContent.pageIndex
        
        if ((index == 0) || (index == NSNotFound))
        {
            return nil
        }
        
        index-=1;
        return getViewControllerAtIndex(index: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let pageContent: OnBoardingPageContentViewController = viewController as! OnBoardingPageContentViewController
        
        var index = pageContent.pageIndex
        
        if (index == NSNotFound)
        {
            return nil;
        }
        
        index+=1;
        if (index == titles.count)
        {
            return nil;
        }
        return getViewControllerAtIndex(index: index)
    }
    
    //MARK: get view Controller at given index.
    internal func getViewControllerAtIndex(index: NSInteger) -> OnBoardingPageContentViewController {
        // Create a new view controller and pass suitable data.
        let pageContentViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PageContentViewController") as! OnBoardingPageContentViewController
        initPageViewData()
        pageContentViewController.onBoardingViewModelData = OnBoardingViewModel(data: OnBoardingModel(onBoardingTitle: titles[index], pageIndex: index))
        pageContentViewController.pageIndex = index
        
        pageContentViewController.delegate = self
        currentPageIndex = pageContentViewController.pageIndex
        
        return pageContentViewController
    }
}

