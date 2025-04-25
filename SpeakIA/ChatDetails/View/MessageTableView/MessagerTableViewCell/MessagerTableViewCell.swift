//
//  MessagerTableViewCell.swift
//  SpeakIA
//
//  Created by William Brando Estrada Tepec on 4/13/25.
//

import UIKit

class MessagerTableViewCell: UITableViewCell, XibInitializable {
    
    @IBOutlet weak var messagerLabel: UILabel!
    @IBOutlet weak var contentMessageView: UIView!
    @IBOutlet weak var stackMessageView: UIStackView!
    @IBOutlet weak var messengeSeenStackView: UIStackView!
    @IBOutlet weak var messageSeenLbl: UILabel!
    @IBOutlet weak var separatorView: UIView!
    @IBOutlet weak var messageTranslateLbl: UILabel!



    @IBOutlet weak  var constraintsRigth: NSLayoutConstraint!
    @IBOutlet weak  var constraintsLeft: NSLayoutConstraint!
    
    var spinner: UIActivityIndicatorView?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //inicializardor por nib
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        contentView.setNeedsLayout()
        contentView.layoutIfNeeded()

    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        // Aquí limpias la celda
        messagerLabel.text = nil
        messageTranslateLbl.text = nil
        separatorView.isHidden = true
        spinner = nil
    }


    
   /* func setupUI() {
        contentMessageView.addRoundCorners(cornerRadius: 10)
        constraintsLeft.constant = UIScreen.main.bounds.width * 1/3
        
        contentMessageView.translatesAutoresizingMaskIntoConstraints = false
        stackMessageView.translatesAutoresizingMaskIntoConstraints = false
    }*/
    
    func loadData(data: MessagesModel?) {
        print("method first")
        self.messagerLabel.text = data?.msg
        
        if Constants.currentId == data?.id {
            constraintsLeft.constant = UIScreen.main.bounds.width * 1/3
            constraintsRigth.constant = 10
            contentMessageView.backgroundColor = .lightGray.withAlphaComponent(0.5)
            messengeSeenStackView.alignment = .trailing

        } else {
            constraintsRigth.constant = UIScreen.main.bounds.width * 1/3
            constraintsLeft.constant = 10
            contentMessageView.backgroundColor = UIColor.systemBlue.withAlphaComponent(0.8)
            messengeSeenStackView.alignment = .leading
        }
        
        if  ((data?.isTralated) != nil)  {
            separatorView.isHidden = false
            starSpinner()
            
            guard let translate = data?.translate else { return }
            messageTranslateLbl.text = translate
        } else {
            stopSpinner()
        }
        
    }
    
    func loadDataTranslate(traduction: String?) {
        separatorView.isHidden = false
        messageTranslateLbl.isHidden = false
        
        guard let translate = traduction else { return }
        messageTranslateLbl.text = translate
        
    }
    
    func starSpinner() {
        if let spinnerIndicator = spinner {
            spinnerIndicator.startAnimating()
        } else {
            let spinnerIndicator = UIActivityIndicatorView(style: .medium)
            spinnerIndicator.startAnimating()
            spinner = spinnerIndicator
            stackMessageView.addArrangedSubview(spinnerIndicator)
        }
    }
    
    func stopSpinner(){
        if let spinnerIndicator = spinner {
            spinnerIndicator.stopAnimating()
            spinnerIndicator.removeFromSuperview()
        }
    }
    
    func setupUI() {
        print("method first 2")
        selectionStyle = .none

        separatorView.isHidden = true
        messageTranslateLbl.isHidden = true
        
        messagerLabel.numberOfLines = 0
        contentMessageView.addRoundCorners(cornerRadius: 12)
        
    }
    
}
