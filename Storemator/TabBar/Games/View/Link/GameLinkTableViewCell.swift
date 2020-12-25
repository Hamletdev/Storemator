//
//  GameLinkTableViewCell.swift
//  Storemator
//
//  Created by Amit Chaudhary on 12/26/20.
//  Copyright © 2020 Amit Chaudhary. All rights reserved.
//

import UIKit

fileprivate let linkDataSource: [String] = [
    "Add a Payment Method",
    "Parents' Guide to the App",
    "About In-App Purchases",
    "About Apps & Games for Your Kids",
    "About Personalisation",
    "New to the App Store",
]

fileprivate let reUseCellIdentifier = "GameLinkCell"

class GameLinkTableViewCell: UITableViewCell {

    let cellHeaderView: GameLinksHeaderView = {
        let frame = CGRect(x: 0, y: 0, width: getCurrentWindow().bounds.size.width, height: 42)
        let cHV = GameLinksHeaderView(frame: frame)
        return cHV
    }()
    
    lazy var cellTableView: GameLinkTableView = {
        let frame = CGRect(x: 0, y: 42, width: getCurrentWindow().bounds.size.width, height: 270)
        let cTV = GameLinkTableView(frame: frame)
        cTV.delegate = self
        cTV.dataSource = self
        return cTV
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layoutIfNeeded()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.addSubview(cellHeaderView)
        self.addSubview(cellTableView)
    }
}


//MARK: - UITVDelegate, UITVDataSource
extension GameLinkTableViewCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.cellTableView {
            return linkDataSource.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == self.cellTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: reUseCellIdentifier, for: indexPath)
            cell.textLabel?.text = linkDataSource[indexPath.row]
            cell.textLabel?.textColor = .systemBlue
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    
}