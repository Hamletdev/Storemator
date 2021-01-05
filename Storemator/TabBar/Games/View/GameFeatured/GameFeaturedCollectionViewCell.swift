//
//  GameFeaturedCollectionViewCell.swift
//  Storemator
//
//  Created by Amit Chaudhary on 12/25/20.
//  Copyright © 2020 Amit Chaudhary. All rights reserved.
//

import UIKit

class GameFeaturedCollectionViewCell: UICollectionViewCell {
    
    let topView: UIView = {
        let aUIView = UIView()
        aUIView.backgroundColor = .lightGray
        return aUIView
    }()
    
    let featuredLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.font = .monospacedSystemFont(ofSize: 12, weight: UIFont.Weight.medium)
        aLabel.textColor = .systemBlue
        return aLabel
    }()
    
    let nameLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.font = .monospacedSystemFont(ofSize: 22, weight: UIFont.Weight.black)
        aLabel.textColor = .black
        return aLabel
    }()
    
    let categoryLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.font = .monospacedSystemFont(ofSize: 18, weight: UIFont.Weight.regular)
        aLabel.textColor = .lightGray
        return aLabel
    }()
    
    let coverImageView: UIImageView = {
        let aImageView = UIImageView()
        aImageView.contentMode = .scaleAspectFill
        aImageView.layer.masksToBounds = true
        return aImageView
    }()
    
    var featuredGame: GameFeatured? {
        didSet {
            guard let safeGameFeatured = self.featuredGame else {return}
            self.categoryLabel.text = safeGameFeatured.categoryName
            self.featuredLabel.text = safeGameFeatured.featuredText
            self.nameLabel.text = safeGameFeatured.appName
            self.coverImageView.image = UIImage(named: safeGameFeatured.coverImageName)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layoutIfNeeded()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        self.addSubview(topView)
        topView.anchorView(top: self.topAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, topPadding: 0, leftPadding: 20, bottomPadding: 0, rightPadding: 20, width: 0, height: 0.4)
        
        self.addSubview(featuredLabel)
        featuredLabel.anchorView(top: self.topView.bottomAnchor, left: self.leftAnchor, bottom: nil, right: nil, topPadding: 5, leftPadding: 20, bottomPadding: 0, rightPadding: 0, width: 0, height: 0)
        
        self.addSubview(nameLabel)
        nameLabel.anchorView(top: self.featuredLabel.bottomAnchor, left: self.leftAnchor, bottom: nil, right: nil, topPadding: 4, leftPadding: 20, bottomPadding: 0, rightPadding: 0, width: 0, height: 0)
        
        self.addSubview(categoryLabel)
        categoryLabel.anchorView(top: self.nameLabel.bottomAnchor, left: self.leftAnchor, bottom: nil, right: nil, topPadding: 3, leftPadding: 20, bottomPadding: 0, rightPadding: 0, width: 0, height: 0)
        
        self.addSubview(coverImageView)
        coverImageView.anchorView(top: self.categoryLabel.bottomAnchor, left: self.leftAnchor, bottom: nil, right: nil, topPadding: 5, leftPadding: 2, bottomPadding: 0, rightPadding: 0, width: self.bounds.size.width - 20, height: 200)
        //coverImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        coverImageView.layer.cornerRadius = 15
        
    }
    
}
