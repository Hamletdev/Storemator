//
//  TodayViewCell.swift
//  Storemator
//
//  Created by Amit Chaudhary on 12/24/20.
//  Copyright © 2020 Amit Chaudhary. All rights reserved.
//

import Foundation
import UIKit

class TodayViewCell: UICollectionViewCell {
    
//MARK: - Properties
    
    lazy var bgView: UIView = {
        let aView = UIView()
        aView.layer.shadowColor = UIColor.black.cgColor
        aView.layer.shadowOffset = CGSize(width: 0, height: 1)
        aView.layer.shadowOpacity = 0.4
        return aView
    }()
    
    lazy var bgImageView: UIImageView = {
        let aIV = UIImageView()
        aIV.contentMode = .scaleAspectFill
        aIV.layer.cornerRadius = 18.0
        aIV.layer.masksToBounds = true
        return aIV
    }()
    
    
//MARK: - Methods
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//MARK: - Helper Methods
extension TodayViewCell {
    
    func setupUI() {
        self.addSubview(bgView)
        bgView.anchorView(top: self.topAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, topPadding: 0, leftPadding: 20, bottomPadding: 0, rightPadding: 20, width: 0, height: 390)
        
        bgView.addSubview(bgImageView)
        bgImageView.anchorView(top: bgView.topAnchor, left: bgView.leftAnchor, bottom: bgView.bottomAnchor, right: bgView.rightAnchor, topPadding: 0, leftPadding: 0, bottomPadding: 0, rightPadding: 0, width: 0, height: 0)
        
    }
}
