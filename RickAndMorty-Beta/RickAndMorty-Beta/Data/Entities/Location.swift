//
//  Location.swift
//  RickAndMorty-Beta
//
//  Created by MacOS on 15.10.2021.
//

import Foundation
import RealmSwift
class Location : Object , Codable {
    @objc dynamic var name : String?
    @objc dynamic var url : String?

    enum CodingKeys: String, CodingKey {

        case name = "name"
        case url = "url"
    }



}
