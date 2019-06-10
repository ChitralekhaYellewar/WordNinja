//
//  OnBoardingPageContentViewController.swift
//  WordNinja
//
//  Created by Chitralekha Yellewar on 10/06/19.
//  Copyright © 2019 Chitralekha Yellewar. All rights reserved.
//

import UIKit

protocol onBoardingProtocol {
    func goNextPage()
    func goPrevPage()
}

let GET_STARTED = "GET STARTED"
let PREVIOUS = "PREVIOUS"
let NEXT = "NEXT"

class OnBoardingPageContentViewController: UIViewController {
    
    @IBOutlet var onBoardingView: OnBoardingView!
    
    var delegate: onBoardingProtocol?
    var pageIndex: Int = 0
    var strTitle: String!
    var strDesc: String!
    
    var onBoardingViewModelData : OnBoardingViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let onBoardingData = onBoardingViewModelData else {
            return
        }
        onBoardingView.onBoardingViewModel = onBoardingData
    }
    
    func navigateToHomeScreen() {
        self.performSegue(withIdentifier: Constants.SegueIdentifiers.SHOW_GAME_SCREEN, sender: nil)
    }
    
    
    @IBAction func nextTapped(_ sender: UIButton) {
        delegate?.goNextPage()
    }
    
    
    @IBAction func prevTapped(_ sender: UIButton) {
        delegate?.goPrevPage()
    }
    
    
    @IBAction func getStarted(_ sender: UIButton) {
        UserDefaults.standard.set(true, forKey: Constants.ONBOARDING)
        navigateToHomeScreen()
    }
    
}
