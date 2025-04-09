//
//  WelcomMenuCellCollectionView.swift
//  SpeakIA
//
//  Created by William Brando Estrada Tepec on 4/8/25.
//

import UIKit


class WelcomMenuCollectionViewCell: UICollectionViewCell, XibInitializable {
    
    @IBOutlet weak var coverImgCell: UIImageView!
    
    @IBOutlet weak var titleLbl: UILabel!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
       // setupUI()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: 12).cgPath
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        coverImgCell.image = nil
    }
    
    func setData(data: LearningMethod) {
        titleLbl.text = data.title
        
        guard let img = data.img else {return}
        
        if let skeleton = coverImgCell.viewWithTag(999) {
            skeleton.removeFromSuperview()
        }

        coverImgCell.hideSkeletonShimmer()
        coverImgCell.image = UIImage(named: img, in: BundleClass().bundle, with: .none )
    }
    
    func setupUI() {
        self.addRoundCorners(cornerRadius: 15)
        self.coverImgCell.downLoadImgSpeakIA(urlStr: "")
       /* let skeleton = SkeletonView(frame: self.frame)
        skeleton.tag = 999
        contentView.addSubview(skeleton)*/
    }
}
