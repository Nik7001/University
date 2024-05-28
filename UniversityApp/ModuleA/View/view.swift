//
//  view.swift
//  UniversityApp
//
//  Created by Admin on 28/05/24.
//

import Foundation
import UIKit

protocol ListingViewProtocol: AnyObject {
    func showUniversities(_ universities: [University])
    func showError(_ errorMessage: String)
}

class ListingViewController: UIViewController, ListingViewProtocol {
    var presenter: ListingPresenterProtocol?

    private var universities: [University] = []

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        presenter?.viewDidLoad()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }

    func showUniversities(_ universities: [University]) {
        self.universities = universities
        tableView.reloadData()
    }

    func showError(_ errorMessage: String) {
        // Show an error message
    }
}

extension ListingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return universities.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let university = universities[indexPath.row]
        cell.textLabel?.text = university.name
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let university = universities[indexPath.row]
        presenter?.didSelectUniversity(university)
    }
}
