//
//  Extension+UIImageView.swift
//  SpeakIA
//
//  Created by William Brando Estrada Tepec on 4/9/25.
//
import UIKit


extension UIImageView {
    func downLoadImgSpeakIA(urlStr: String, contenMoe mode: UIView.ContentMode = .scaleAspectFill) {
        //guard let url = URL(string: urlStr) else { return }
        contentMode = mode
        self.showSkeleton()
        
       /* ImageRequestManager.shared.downloadImg(url: url) { [weak self] image, error, onCache in
            DispatchQueue.main.async {
                if let _ = error {
                    self?.image = UIImage(named: "App_Icon")
                    self?.stopAnimating()
                } else if let image = image {
                    self?.image = image
                    self?.stopAnimating()
                } else {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                        self?.image = UIImage(named: "App_Icon")
                        self?.stopAnimating()
                    }
                }
            }
        }*/
    }
    func showSkeleton() {
        let skeletonView = SkeletonView(frame: self.frame)
        skeletonView.tag = 999
        addSubview(skeletonView)
    }
    
    func showSqueletonSpeakIA()  {
        self.contentMode = .scaleAspectFill
        self.clipsToBounds = true
        self.backgroundColor = UIColor.lightGray
        self.layer.cornerRadius = 10

        
        let animation = CABasicAnimation(keyPath: #keyPath(CALayer.opacity))
        animation.fromValue = 0.0
        animation.toValue = 0.9
        animation.duration = 0.79
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        let randomDelay = Double.random(in: 0.0...0.5)
        animation.beginTime = CACurrentMediaTime() + randomDelay
        animation.repeatCount = .greatestFiniteMagnitude
        animation.autoreverses = true
        self.layer.add(animation, forKey: "animateOpacity")
        /*self.image = nil
        self.backgroundColor = UIColor(white: 0.85, alpha: 1.0)
        self.clipsToBounds = true
        self.layer.cornerRadius = 10

        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = [
            UIColor(white: 0.85, alpha: 1).cgColor,
            UIColor(white: 0.95, alpha: 1).cgColor,
            UIColor(white: 0.85, alpha: 1).cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        gradientLayer.locations = [0.0, 0.5, 1.0]
        gradientLayer.name = "skeletonShimmer"

        self.layer.addSublayer(gradientLayer)

        let animation = CABasicAnimation(keyPath: "locations")
        animation.fromValue = [-1.0, -0.5, 0.0]
        animation.toValue = [1.0, 1.5, 2.0]
        animation.duration = 1.0
        animation.repeatCount = .infinity

        gradientLayer.add(animation, forKey: "shimmer")*/

    }
    func hideSkeletonShimmer() {
        DispatchQueue.main.async {
            self.alpha = 1.0
            self.layer.removeAnimation(forKey: "animateOpacity")
            
        }
    }
}
