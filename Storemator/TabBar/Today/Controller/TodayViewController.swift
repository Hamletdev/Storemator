//
//  TodayViewController.swift
//  Storemator
//
//  Created by Amit Chaudhary on 12/24/20.
//  Copyright © 2020 Amit Chaudhary. All rights reserved.
//

import Foundation
import UIKit

fileprivate let reUseIdentifier = "TodayCell"
fileprivate let reUseHeaderIdentifier = "TodayHeaderCell"

class TodayViewController: UICollectionViewController {
    
    var selectedCell: TodayViewCell?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.collectionView.backgroundColor = .white
        self.collectionView.register(TodayViewCell.self, forCellWithReuseIdentifier: reUseIdentifier)
        self.collectionView.register(TodayHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: reUseHeaderIdentifier)
//        self.collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}


//MARK: - UICVDataSource
extension TodayViewController {
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: reUseIdentifier, for: indexPath) as! TodayViewCell
        if indexPath.row == 0 {
            cell.bgImageView.image = #imageLiteral(resourceName: "cover_4")
        } else  {
            cell.bgImageView.image = #imageLiteral(resourceName: "cover_5")
        }
        return cell
    }
}


//MARK: - UITableViewDelegate
extension TodayViewController {
    
    override func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        guard let row = self.collectionView.cellForItem(at: indexPath) as? TodayViewCell else {
            return
        }
        UIView.animate(withDuration: 0.1) {
            row.bgView.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        guard let row = self.collectionView.cellForItem(at: indexPath) as? TodayViewCell else {return}
        UIView.animate(withDuration: 0.3) {
            row.bgView.transform = CGAffineTransform(scaleX: 1, y: 1)
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let todayDetailVC = TodayDetailViewController()
        todayDetailVC.selectedCell = (self.collectionView.cellForItem(at: indexPath) as! TodayViewCell)
        todayDetailVC.modalPresentationStyle = .fullScreen
        self.present(todayDetailVC, animated: true, completion: nil)
    }
}


// MARK: - UICollectionViewDelegateFlowLayout

extension TodayViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if self.view.traitCollection.horizontalSizeClass == .compact {
            return CGSize(width: getCurrentWindow().bounds.size.width, height: 390)
        } else {
            
            // Number of Items per Row
            let numberOfItemsInRow = 2
            
            // Current Row Number
            let rowNumber = indexPath.item/numberOfItemsInRow
            
            // Compressed With
            let compressedWidth = getCurrentWindow().bounds.size.width/3
            
            // Expanded Width
            let expandedWidth = (getCurrentWindow().bounds.size.width/3) * 2
            
            // Is Even Row
            let isEvenRow = rowNumber % 2 == 0
            
            // Is First Item in Row
            let isFirstItem = indexPath.item % numberOfItemsInRow != 0
            
            // Calculate Width
            var width: CGFloat = 0.0
            if isEvenRow {
                width = isFirstItem ? compressedWidth : expandedWidth
            } else {
                width = isFirstItem ? expandedWidth : compressedWidth
            }
            
            return CGSize(width: width, height: 390)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: getCurrentWindow().bounds.size.width, height: 90)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let sectionHeader = self.collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: reUseHeaderIdentifier, for: indexPath) as! TodayHeaderView
        sectionHeader.userAccountDisclosure = {
            let accountVC = AccountViewController()
            let navigationController = UINavigationController(rootViewController: accountVC)
            self.present(navigationController, animated: true, completion: nil)
        }
        return sectionHeader
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 25
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
}
