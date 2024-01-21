//
//  ListCell.swift
//  PomoschTest
//
//  Created by Georgy on 21.01.2024.
//

import UIKit

final class ListCell: UITableViewCell{
    static let reuseId = "ListCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        self.textLabel?.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        self.textLabel?.textColor = .black
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(with patient:String){
        self.textLabel?.text = patient
        self.imageView?.image = UIImage(named: "testImage")
        self.textLabel?.text = patient
    }
}
