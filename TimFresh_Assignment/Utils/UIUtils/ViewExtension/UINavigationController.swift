//
//  UINavigationController.swift
//  TimFresh_Assignment
//
//  Created by Derrick kim on 11/21/23.
//

import UIKit

extension UINavigationController: UIGestureRecognizerDelegate {
    // BackButton hidden 시 swipe 안되는 부분 설정
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }
    
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
