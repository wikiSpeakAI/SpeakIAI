//
//  SkeletonView.swift
//  SpeakIA
//
//  Created by William Brando Estrada Tepec on 4/9/25.
//
import UIKit

class SkeletonView: UIView {
    private let gradientLayer = CAGradientLayer()

    override func layoutSubviews() {
        super.layoutSubviews()

        backgroundColor = .lightGray
        gradientLayer.frame = bounds
        gradientLayer.colors = [
            UIColor(white: 0.85, alpha: 0.7).cgColor,
            UIColor(white: 0.95, alpha: 0.7).cgColor,
            UIColor(white: 0.85, alpha: 0.7).cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.locations = [0.0, 0.5, 1.0]

        layer.addSublayer(gradientLayer)

        let animation = CABasicAnimation(keyPath: "locations")
        animation.fromValue = [-1.0, -0.5, 0.0]
        animation.toValue = [1.0, 1.5, 2.0]
        animation.duration = 1.2
        animation.repeatCount = .infinity

        gradientLayer.add(animation, forKey: "shimmer")
    }
}
