//
//  router.swift
//  UniversityApp
//
//  Created by Admin on 28/05/24.
//

import Foundation
import UIKit

protocol ListingRouterProtocol: AnyObject {
    func navigateToDetails(with university: University)
}

class ListingRouter: ListingRouterProtocol {
    weak var viewController: UIViewController?

    static func createModule() -> UIViewController {
        let view = ListingViewController()
        let interactor = ListingInteractor()
        let presenter = ListingPresenter()
        let router = ListingRouter()

        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        router.viewController = view

        return view
    }

    func navigateToDetails(with university: University) {
        let detailsViewController = DetailsRouter.createModule(with: university)
        viewController?.navigationController?.pushViewController(detailsViewController, animated: true)
    }
}
