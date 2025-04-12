//
//  Extension+UIView.swift
//  SpeakIA
//
//  Created by William Brando Estrada Tepec on 4/9/25.
//
import UIKit

extension UIView {
    func addRoundCorners(cornerRadius: CGFloat) {
        DispatchQueue.main.async {
            self.layer.cornerRadius = cornerRadius
            self.clipsToBounds = true
        }
        
    }
    
    func addSubView(viewChild: UIView) {
        self.addSubview(viewChild)
        NSLayoutConstraint.activate([
            viewChild.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            viewChild.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            viewChild.topAnchor.constraint(equalTo: self.topAnchor),
            viewChild.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
}

