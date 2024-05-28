//
//  Interactor.swift
//  UniversityApp
//
//  Created by Admin on 28/05/24.
//

import RealmSwift
import Alamofire

protocol ListingInteractorInputProtocol: AnyObject {
    func fetchUniversities()
}

protocol ListingInteractorOutputProtocol: AnyObject {
    func universitiesFetched(_ universities: [University])
    func fetchingFailed(with error: Error)
}

class ListingInteractor: ListingInteractorInputProtocol {
    weak var presenter: ListingInteractorOutputProtocol?

    func fetchUniversities() {
        let url = "http://universities.hipolabs.com/search?country=United%20Arab%20Emirates"
        AF.request(url).responseDecodable(of: [University].self) { response in
            switch response.result {
            case .success(let universities):
                self.saveUniversitiesToLocalDatabase(universities)
                self.presenter?.universitiesFetched(universities)
            case .failure(let error):
                self.fetchUniversitiesFromLocalDatabase(error)
            }
        }
    }

    private func saveUniversitiesToLocalDatabase(_ universities: [University]) {
        let realm = try! Realm()
        try! realm.write {
            realm.add(universities, update: .all)
        }
    }

    private func fetchUniversitiesFromLocalDatabase(_ error: Error) {
        let realm = try! Realm()
        let universities = Array(realm.objects(University.self))
        if universities.isEmpty {
            self.presenter?.fetchingFailed(with: error)
        } else {
            self.presenter?.universitiesFetched(universities)
        }
    }
}

