//
//  ListCell.swift
//  PomoschTest
//
//  Created by Georgy on 21.01.2024.
//

import UIKit
import Kingfisher

final class ListCell: UITableViewCell{
    static let reuseId = "ListCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        self.textLabel?.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        self.textLabel?.textColor = .black
        self.imageView?.contentMode = .scaleAspectFit
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(with patient:Person){
        self.textLabel?.text = patient.fullName
        self.imageView?.kf.setImage(with: patient.photoURL)
    }
}
