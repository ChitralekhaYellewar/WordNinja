//
//  OnBoardingViewModel.swift
//  WordNinja
//
//  Created by Chitralekha Yellewar on 10/06/19.
//  Copyright © 2019 Chitralekha Yellewar. All rights reserved.
//

import Foundation

struct OnBoardingViewModel {
    let title: String
    let index: Int
    
    init(data: OnBoardingModel) {
        title = data.onBoardingTitle
        index = data.pageIndex
    }
}
