//
//  ChatCollectionViewCell.swift
//  SpeakIA
//
//  Created by William Brando Estrada Tepec on 4/12/25.
//
import UIKit

class ChatCollectionViewCell: UICollectionViewCell, XibInitializable {
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var contentMessageView: UIView!
    @IBOutlet weak var constraintsRight: NSLayoutConstraint!
    @IBOutlet weak var constraintsLeft: NSLayoutConstraint!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    

    override func layoutSubviews() {
        super.layoutSubviews()
        constraintsRight.constant = UIScreen.main.bounds.width * 1/3
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        backgroundColor = .blue
        //messageLabel.text = nil
    }
    
    func setupUI() {
        backgroundColor = .blue
       // contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width ).isActive = true
        NSLayoutConstraint.activate([
            
        ])
          messageLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: contentMessageView.topAnchor, constant: 8),
            messageLabel.bottomAnchor.constraint(equalTo: contentMessageView.bottomAnchor, constant: -8),
            messageLabel.leadingAnchor.constraint(equalTo: contentMessageView.leadingAnchor, constant: 10),
            messageLabel.trailingAnchor.constraint(equalTo: contentMessageView.trailingAnchor, constant: -10)
        ])
        messageLabel.lineBreakMode = .byWordWrapping
        
        
        constraintsRight.constant = UIScreen.main.bounds.width * 1/3
        constraintsRight.isActive = true
    }
    
    
    func setData(data: MessagesModel?) {
        guard let data = data else { return }
        messageLabel.text = data.msg
        
        constraintsRight.constant = UIScreen.main.bounds.width * 1/3
        constraintsRight.isActive = true
        

    }
}
