//
//  ListViewController.swift
//  PomoschTest
//
//  Created by Georgy on 21.01.2024.
//

import UIKit

protocol ListViewControllerProtocol: AnyObject {
    func fetchNextPage()
    func showDetailView(with person:Person)
}

final class ListViewController: UIViewController {
    // MARK: - UI Elements
    let listTableView = ListTableView()
    
    // MARK: - Variables
    var service = DataCoordinator()
    private var dataCoordinatorObserver: NSObjectProtocol?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        addSubviews()
        applyConstraints()
        service.initialize()
        addObserver()
    }
}

// MARK: - Layout
extension ListViewController {
    private func configureUI() {
        view.backgroundColor = .white
        title = "Пациенты"
        
        listTableView.delegateVC = self
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

//MARK: - Notification center
extension ListViewController{
    private func addObserver(){
        dataCoordinatorObserver = NotificationCenter.default
            .addObserver(
                forName: DataCoordinator.didChangeNotification,
                object: nil,
                queue: .main
            ) { [weak self] _ in
                guard let self = self else { return }
                listTableView.set(with: service.persons)
            }
    }
}

//MARK: - ListViewControllerProtocol
extension ListViewController:ListViewControllerProtocol{
    func fetchNextPage() {
        service.makeWardsGraphQLCall()
    }
    
    func showDetailView(with person:Person) {
        let detailViewController = DetailViewController()
        
        detailViewController.setupDetailView(with: person)
        
        detailViewController.modalPresentationStyle = .fullScreen
        
        show(detailViewController, sender: self)
    }
}
