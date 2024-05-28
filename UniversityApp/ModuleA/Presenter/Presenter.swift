//
//  Presenter.swift
//  UniversityApp
//
//  Created by Admin on 28/05/24.
//

protocol ListingPresenterProtocol: AnyObject {
    func viewDidLoad()
    func didSelectUniversity(_ university: University)
}

class ListingPresenter: ListingPresenterProtocol {
    weak var view: ListingViewProtocol?
    var interactor: ListingInteractorInputProtocol?
    var router: ListingRouterProtocol?

    func viewDidLoad() {
        interactor?.fetchUniversities()
    }

    func didSelectUniversity(_ university: University) {
        router?.navigateToDetails(with: university)
    }
}

extension ListingPresenter: ListingInteractorOutputProtocol {
    func universitiesFetched(_ universities: [University]) {
        view?.showUniversities(universities)
    }

    func fetchingFailed(with error: Error) {
        view?.showError(error.localizedDescription)
    }
}
