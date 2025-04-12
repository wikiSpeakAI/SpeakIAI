//
//  ChatListTableCell.swift
//  SpeakIA
//
//  Created by William Brando Estrada Tepec on 4/11/25.
//

import UIKit

class ChatListTableViewCell: UITableViewCell, XibInitializable {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var lastMessageLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var avatarImgView: UIImageView!
    @IBOutlet weak var badgeCountMsg: UIView!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    
    func setData(data: UserChat) {
        
        if let skeleton = self.viewWithTag(999) {
            skeleton.removeFromSuperview()
        }
        
        nameLabel.text = data.name
        lastMessageLabel.text = data.lastMessage
        timeLabel.text = data.lastMessageDate
        
        //descargar imagen de perfil
        if var imgProfile = data.avatar {
           // avatarImgView.downLoadImgSpeakIA(urlStr: imgProfile)
        }
    }
    
    private func setupUI() {
        avatarImgView.addRoundCorners(cornerRadius: avatarImgView.bounds.width / 2)
        var skeletonCell = SkeletonView(frame: self.frame)
        skeletonCell.tag = 999
        addSubview(skeletonCell)
    }
}
