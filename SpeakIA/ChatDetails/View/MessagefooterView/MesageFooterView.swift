//
//  MesaggeFooterView.swift
//  SpeakIA
//
//  Created by William Brando Estrada Tepec on 4/19/25.
//
import UIKit
protocol MesageFooterViewDelegate: AnyObject{
    func sendMessage(msg: String?)
}

class MesageFooterView: UIView {
    
    @IBOutlet weak var contentStackView: UIStackView!
    @IBOutlet weak var textContentView: UIView!
    @IBOutlet weak var mesaggeTextView: UITextView!
    @IBOutlet weak var sendMesaggeBtn: UIImageView!
    @IBOutlet weak var contentMenuStackView: UIStackView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var heigthTextView: NSLayoutConstraint!
    
    weak var delegate: MesageFooterViewDelegate?
    var heigthMaxContentView: CGFloat = 200.0
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
    }
    
    func setupUI() {
        Bundle(for: Self.self).loadNibNamed("MessageFooterView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        textContentView.addRoundCorners(cornerRadius: 20)
        
       // mesaggeTextView.isScrollEnabled = false
        mesaggeTextView.delegate = self
        
    }
    

    
    func configureHeigthView(height: CGFloat) {
        if  height >=  heigthMaxContentView {
            heigthTextView.constant = heigthMaxContentView
        } else {
            heigthTextView.constant = height
        }
    }
    
    
    func adjustTextViewHeight() {
        let fittingSize = CGSize(width: mesaggeTextView.frame.width, height: .greatestFiniteMagnitude)
        let size = mesaggeTextView.sizeThatFits(fittingSize)

        let maxHeight: CGFloat = 150 // or any max you want
        let newHeight = min(size.height + 9.0, maxHeight)

        heigthTextView.constant = newHeight
        layoutIfNeeded()
    }
    
}
extension MesageFooterView: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        adjustTextViewHeight()
    }
}
