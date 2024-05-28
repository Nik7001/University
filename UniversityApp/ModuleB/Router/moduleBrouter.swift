//
//  moduleBrouter.swift
//  UniversityApp
//
//  Created by Admin on 28/05/24.
//

import UIKit

protocol DetailsRouterProtocol: AnyObject {
    func navigateBackToListing()
}

class DetailsRouter: DetailsRouterProtocol {
    weak var viewController: UIViewController?

    static func createModule(with university: University) -> UIViewController {
        let view = DetailsViewController()
        let interactor = DetailsInteractor()
        let presenter = DetailsPresenter(university: university)
        let router = DetailsRouter()

        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        router.viewController = view

        return view
    }

    func navigateBackToListing() {
        viewController?.navigationController?.popViewController(animated: true)
        // You can also add logic here to trigger a refresh in ListingViewController
        if let listingVC = viewController?.navigationController?.viewControllers.first(where: { $0 is ListingViewController }) as? ListingViewController {
            listingVC.presenter?.viewDidLoad()
        }
    }
}
