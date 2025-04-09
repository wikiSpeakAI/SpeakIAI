//
//  XibInitializable.swift
//  AppDondeBanco
//
//  Created by Administrador on 16/08/24.
//

import UIKit

protocol XibInitializable {
    static func fromXib() -> Self
}
extension XibInitializable where Self: UIView {
    static func fromXib() -> Self {
        return UINib(nibName: self.reuseIdentifier, bundle: BundleClass().bundle).instantiate(withOwner: nil, options: nil)[0] as! Self
    }
}


protocol ReuseIdentifier {}

extension ReuseIdentifier {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UIView: ReuseIdentifier {}
extension UIViewController: ReuseIdentifier {}
