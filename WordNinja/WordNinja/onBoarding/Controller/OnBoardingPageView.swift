//
//  OnBoardingPageView.swift
//  WordNinja
//
//  Created by Chitralekha Yellewar on 10/06/19.
//  Copyright © 2019 Chitralekha Yellewar. All rights reserved.
//

import Foundation

extension OnBoardingPageViewController {
    
    func goNextPage() {
        guard let index = currentPageIndex else {
            return
        }
        let nextPageIndex = index + 1
        if nextPageIndex < images.count {
            self.currentPage = getViewControllerAtIndex(index: nextPageIndex)
            
            self.setViewControllers([self.currentPage], direction: .forward, animated: false, completion: nil)
            self.pageControl.currentPage = nextPageIndex
            
            if nextPageIndex == titles.count - 1 {
                self.pageControl.removeFromSuperview()
                let page = self.viewControllers![0] as! OnBoardingPageContentViewController
                page.onBoardingView.getStartedButton.isHidden = false
            } else {
                self.view.addSubview(pageControl)
                self.view.layoutIfNeeded()
            }
        }
                
    }
    
    func goPrevPage() {
        guard let index = currentPageIndex else {
            return
        }
        let previousPageIndex = index > 0 ? index - 1 : 0
        if  previousPageIndex >= 0 {
            self.currentPage = getViewControllerAtIndex(index: previousPageIndex)
            
            self.setViewControllers([self.currentPage], direction: .reverse, animated: false, completion: nil)
            self.pageControl.currentPage = previousPageIndex
        }
        
    }
}
