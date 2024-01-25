//
//  ListViewController.swift
//  PomoschTest
//
//  Created by Georgy on 21.01.2024.
//

import UIKit

final class ListViewController: UIViewController {
    // MARK: - UI Elements
    let listTableView = ListTableView()
    
    // MARK: - Variables
    var mockPatients = ["Иван Иванов", "Петр Дьяченко", "Лариса Харитонова"]
    var service = DataCoordinator()
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        addSubviews()
        applyConstraints()
        listTableView.set(with: mockPatients)
        service.initialize()
        service.makeWardsGraphQLCall(first: 10, after: nil)
    }
}

// MARK: - Layout
extension ListViewController {
    private func configureUI() {
        view.backgroundColor = .white
        title = "Пациенты"
        
    }
    
    private func addSubviews() {
        view.addSubview(listTableView)
    }
    
    private func applyConstraints() {
        NSLayoutConstraint.activate([
            listTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            listTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            listTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            listTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

