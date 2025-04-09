//
//  BaseController.swift
//  SpeakIA
//
//  Created by William Brando Estrada Tepec on 4/8/25.
//
import UIKit

class BaseController: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    
}

extension UINavigationController {
    override open var childForStatusBarStyle: UIViewController? {
        return topViewController
    }
}
