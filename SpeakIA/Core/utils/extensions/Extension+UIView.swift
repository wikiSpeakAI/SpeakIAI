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
    
}

