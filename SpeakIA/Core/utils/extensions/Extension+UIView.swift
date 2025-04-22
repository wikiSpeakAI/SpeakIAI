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
            viewChild.topAnchor.constraint(equalTo: self.topAnchor ),
            viewChild.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    func addSubviewOverTo(parnerView: UIView, childView: UIView) {
        self.addSubview(childView)
        NSLayoutConstraint.activate([
            childView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            childView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            childView.topAnchor.constraint(equalTo: self.topAnchor ),
            childView.bottomAnchor.constraint(equalTo: parnerView.topAnchor)
        ])
    }
    
    func addSubviewBottomTo(view: UIView){
        
    }
    
    func addFullScreenView(_ viewChild: UIView) {
        self.addSubview(viewChild)
        viewChild.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            viewChild.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            viewChild.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            viewChild.topAnchor.constraint(equalTo: self.topAnchor),
            viewChild.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    func addSubViewToBottom(viewChild: UIView){
        self.addSubview(viewChild)
        NSLayoutConstraint.activate([
            viewChild.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            viewChild.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            viewChild.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            //viewChild.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    func addFooterView(_ viewChild: UIView, height: CGFloat = 60) {
        self.addSubview(viewChild)
        viewChild.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            viewChild.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            viewChild.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            viewChild.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            viewChild.heightAnchor.constraint(equalToConstant: height)
        ])
    }
    

    
}

