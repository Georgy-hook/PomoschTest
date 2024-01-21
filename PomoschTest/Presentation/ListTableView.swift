//
//  ListTableView.swift
//  PomoschTest
//
//  Created by Georgy on 21.01.2024.
//

import UIKit

final class ListTableView: UITableView{
    // MARK: - Variables
    private var patients:[String] = []
    
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
        
    }
}

extension ListTableView {
    func set(with patients: [String]) {
        self.patients = patients
        self.reloadData()
    }
}
