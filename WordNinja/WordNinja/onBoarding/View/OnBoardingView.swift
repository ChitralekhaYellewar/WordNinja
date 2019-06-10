//
//  OnBoardingView.swift
//  WordNinja
//
//  Created by Chitralekha Yellewar on 10/06/19.
//  Copyright © 2019 Chitralekha Yellewar. All rights reserved.
//

import UIKit

class OnBoardingView: UIView {
    
    @IBOutlet weak var onBoardingLabel: UILabel!
    @IBOutlet weak var getStartedButton: UIButton!
    @IBOutlet weak var nextPageButton: UIButton!
    @IBOutlet weak var prevPageButton: UIButton!
    @IBOutlet weak var getStartedButtonHeight: NSLayoutConstraint!
    
    var onBoardingViewModel: OnBoardingViewModel! {
        didSet {
            setUI()
            onBoardingLabel.text = onBoardingViewModel.title
        }
    }
    
    func setUI(){
        getStartedButton.backgroundColor = #colorLiteral(red: 0, green: 0.5882352941, blue: 0.8392156863, alpha: 1)
        getStartedButton.setTitle(GET_STARTED, for: .normal)
        
        prevPageButton.setTitle(PREVIOUS, for: .normal)
        nextPageButton.setTitle(NEXT, for: .normal)
    }
    
}
