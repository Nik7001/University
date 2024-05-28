//
//  ModelBPresenter.swift
//  UniversityApp
//
//  Created by Admin on 28/05/24.
//

protocol DetailsPresenterProtocol: AnyObject {
    func viewDidLoad()
    func refreshListingScreen()
}

class DetailsPresenter: DetailsPresenterProtocol {
    weak var view: DetailsViewProtocol?
    var interactor: DetailsInteractorInputProtocol?
    var router: DetailsRouterProtocol?

    private var university: University

    init(university: University) {
        self.university = university
    }

    func viewDidLoad() {
        view?.showUniversityDetails(university)
    }

    func refreshListingScreen() {
        router?.navigateBackToListing()
    }
}
