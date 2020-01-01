//
//  SSNavigationController.swift
//  HandleBackNavigation
//
//  Created by MTQ on 1/1/20.
//  Copyright © 2020 MTQ. All rights reserved.
//

import UIKit

class SSNavigationController: UINavigationController {}

// MARK: - UINavigationBarDelegate
extension SSNavigationController: UINavigationBarDelegate {
    func navigationBar(_ navigationBar: UINavigationBar, shouldPop item: UINavigationItem) -> Bool {
        // Handle case tap back button
        if viewControllers.count < navigationBar.items!.count {
            return true
        }
        
        var shouldPop = true
        if let viewController = topViewController as? NavigationControllerBackButtonDelegate {
            shouldPop = viewController.shouldPopOnBackButtonPress()
        }
        
        if shouldPop {
            DispatchQueue.main.async {
                self.popViewController(animated: true)
            }
        } else {
            for view in navigationBar.subviews where view.alpha < 1.0 {
                UIView.animate(withDuration: 0.25, animations: {
                    view.alpha = 1.0
                })
            }
        }
        return false
    }
}

protocol NavigationControllerBackButtonDelegate: class {
    func shouldPopOnBackButtonPress() -> Bool
}
