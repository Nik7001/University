//
//  modelBView.swift
//  UniversityApp
//
//  Created by Admin on 28/05/24.
//

import UIKit

protocol DetailsViewProtocol: AnyObject {
    func showUniversityDetails(_ university: University)
}

class DetailsViewController: UIViewController, DetailsViewProtocol {
    var presenter: DetailsPresenterProtocol?

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()

    private let refreshButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Refresh", for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(nameLabel)
        view.addSubview(refreshButton)

        refreshButton.addTarget(self, action: #selector(refreshButtonTapped), for: .touchUpInside)

        presenter?.viewDidLoad()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        nameLabel.frame = CGRect(x: 20, y: 100, width: view.frame.size.width - 40, height: 100)
        refreshButton.frame = CGRect(x: 20, y: 220, width: view.frame.size.width - 40, height: 50)
    }

    func showUniversityDetails(_ university: University) {
        nameLabel.text = university.name
    }

    @objc private func refreshButtonTapped() {
        presenter?.refreshListingScreen()
    }
}
