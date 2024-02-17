//
//  ListTableView.swift
//  PomoschTest
//
//  Created by Georgy on 21.01.2024.
//

import UIKit

final class ListTableView: UITableView{
    // MARK: - Variables
    private var patients:[Person] = []
    weak var delegateVC: ListViewControllerProtocol?
    
    // MARK: - Initiliazation
    init() {
        super.init(frame: .zero, style: .plain)
        translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .clear
        self.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        self.showsVerticalScrollIndicator = false
        delegate = self
        dataSource = self
        register(ListCell.self, forCellReuseIdentifier: ListCell.reuseId)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UITableViewDataSource
extension ListTableView:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return patients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.dequeueReusableCell(withIdentifier: ListCell.reuseId) as? ListCell
        else { return UITableViewCell() }
        cell.set(with: patients[indexPath.row])
        return cell
    }
}

// MARK: - UITableViewDelegate
extension ListTableView:UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        deselectRow(at: indexPath, animated: true)
        
        delegateVC?.showDetailView(with: patients[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        delegateVC?.fetchNextPage()
    }
}

extension ListTableView {
    func set(with patients: [Person]) {
        
        let oldCount = self.patients.count
        self.patients = patients
        let newCount = self.patients.count
        
        if oldCount != newCount {
            let indexPaths = (oldCount..<newCount).map { i in
                IndexPath(row: i, section: 0)
            }
            self.performBatchUpdates {
                self.insertRows(at: indexPaths, with: .automatic)
            } completion: { _ in }
        }
    }
}
