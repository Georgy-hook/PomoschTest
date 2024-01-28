//
//  ListCell.swift
//  PomoschTest
//
//  Created by Georgy on 21.01.2024.
//

import UIKit
import Kingfisher

final class ListCell: UITableViewCell{
    // MARK: - Reuse ID
    static let reuseId = "ListCell"
    
    // MARK: - UI Elements
    lazy var personImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var fullNameLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.textColor = .black
        return label
    }()
    
    // MARK: - Initiliazation
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        addSubviews()
        applyConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public functions
    func set(with patient:Person){
        fullNameLabel.text = patient.fullName
        personImageView.kf.setImage(with: patient.photoURL)
    }
}

// MARK: - Layout
private extension ListCell{
     func addSubviews() {
        addSubview(personImageView)
        addSubview(fullNameLabel)
    }
    
    func applyConstraints(){
        NSLayoutConstraint.activate([
            personImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            personImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            personImageView.heightAnchor.constraint(equalToConstant: 70),
            personImageView.widthAnchor.constraint(equalToConstant: 70),
            
            fullNameLabel.leadingAnchor.constraint(equalTo: personImageView.trailingAnchor, constant: 10),
            fullNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}
