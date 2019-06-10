//
//  onBoardingTests.swift
//  WordNinjaTests
//
//  Created by Chitralekha Yellewar on 10/06/19.
//  Copyright © 2019 Chitralekha Yellewar. All rights reserved.
//

import XCTest
@testable import WordNinja

class onBoardingTests: XCTestCase {
    var onBoardingModel: OnBoardingModel?
    var onBoardingViewModel: OnBoardingViewModel?
    
    var onBoardingPageView: OnBoardingPageViewController?
    
    var storyBoard : UIStoryboard?

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.onBoardingModel = OnBoardingModel(onBoardingTitle: Constants.pageOneTitle, pageIndex: 0)
        self.onBoardingViewModel = OnBoardingViewModel(data: self.onBoardingModel!)
        self.storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        onBoardingPageView = OnBoardingPageViewController()
    }
    
    //MARK: test for get view controller at index
    func testForGetViewControllerAtIndexNotNil() {
        let viewController = onBoardingPageView?.getViewControllerAtIndex(index: 0)
        XCTAssertNotNil(viewController)
    }

    override func tearDown() {
        onBoardingModel = nil
        onBoardingViewModel = nil
        onBoardingPageView = nil
    }
}
