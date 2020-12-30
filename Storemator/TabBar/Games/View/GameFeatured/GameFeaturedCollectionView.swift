//
//  GameFeaturedCollectionView.swift
//  Storemator
//
//  Created by Amit Chaudhary on 12/25/20.
//  Copyright © 2020 Amit Chaudhary. All rights reserved.
//

import UIKit

class GameFeaturedCollectionView: UICollectionView {
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        self.backgroundColor = .white
        self.register(GameFeaturedCollectionViewCell.self, forCellWithReuseIdentifier: reUseCellFeaturedIdentifier)
        self.decelerationRate = UIScrollView.DecelerationRate.fast
        self.showsHorizontalScrollIndicator = false
        self.showsVerticalScrollIndicator = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
