//
//  ViewControllerSecond.swift
//  HandleBackNavigation
//
//  Created by MTQ on 1/1/20.
//  Copyright © 2020 MTQ. All rights reserved.
//

import UIKit

class ViewControllerSecond: UIViewController {}

// MARK: - NavigationControllerBackButtonDelegate
extension ViewControllerSecond: NavigationControllerBackButtonDelegate {
    func shouldPopOnBackButtonPress() -> Bool {
        // true: popViewController, false: nothing
        let isPopViewController = false
        return isPopViewController
    }
}
