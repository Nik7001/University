//
//  ModelBentity.swift
//  UniversityApp
//
//  Created by Admin on 28/05/24.
//

import Foundation
import RealmSwift

class University: Object, Decodable {
    @objc dynamic var name: String = ""
    @objc dynamic var country: String = ""
    @objc dynamic var webPage: String = ""

    enum CodingKeys: String, CodingKey {
        case name
        case country
        case webPage = "web_pages"
    }
}
