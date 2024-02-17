//
//  DetailViewController.swift
//  PomoschTest
//
//  Created by Georgy on 26.01.2024.
//

import UIKit

final class DetailViewController: UIViewController {
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
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    lazy var genderLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.textColor = .black
        return label
    }()
    
    lazy var cityLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.textColor = .black
        return label
    }()
    
    lazy var ageLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.textColor = .black
        return label
    }()
    
    lazy var storyLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    lazy var backButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        button.tintColor = .lightGray
        button.backgroundColor = .white
        return button
    }()
    
    lazy var informationStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [fullNameLabel,
                                                       genderLabel,
                                                       ageLabel,
                                                       cityLabel])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // MARK: - Variables
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        configureUI()
        addSubviews()
        applyConstraints()
    }
    
    // MARK: - Public functions
    
    func setupDetailView(with person: Person){
        personImageView.kf.setImage(with: person.photoURL)
        fullNameLabel.text = person.fullName
        genderLabel.text = "Пол: \(person.gender.rawValue)"
        cityLabel.text = "Город: \(person.city)"
        ageLabel.text = "Возраст: \(person.age)"
        storyLabel.text = person.story
    }
    // MARK: - Buttons functions
    @objc func didBackButtonTapped(){
        dismiss(animated: true)
    }
}

// MARK: - Layout
extension DetailViewController {
    private func configureUI() {
        view.backgroundColor = .white
        backButton.addTarget(self, action: #selector(didBackButtonTapped), for: .touchUpInside)
    }
    
    private func addSubviews() {
        view.addSubview(informationStackView)
        view.addSubview(personImageView)
        view.addSubview(storyLabel)
        view.addSubview(backButton)
    }
    
    private func applyConstraints() {
        NSLayoutConstraint.activate([
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            backButton.heightAnchor.constraint(equalToConstant: 40),
            backButton.widthAnchor.constraint(equalToConstant: 40),
            
            personImageView.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 10),
            personImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            personImageView.heightAnchor.constraint(equalToConstant: 100),
            personImageView.widthAnchor.constraint(equalToConstant: 100),
            
            informationStackView.topAnchor.constraint(equalTo: personImageView.topAnchor),
            informationStackView.leadingAnchor.constraint(equalTo: personImageView.trailingAnchor, constant: 10),
            informationStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            storyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            storyLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            storyLabel.topAnchor.constraint(equalTo: personImageView.bottomAnchor, constant: 10),
        ])
    }
}
