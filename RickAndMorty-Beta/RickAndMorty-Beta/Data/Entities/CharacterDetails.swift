//
//  Result.swift
//  RickAndMorty-Beta
//
//  Created by MacOS on 15.10.2021.
//
import Foundation
import RealmSwift
class CharacterDetails : Object , Codable {
    @objc dynamic var id = 0
    @objc dynamic var name : String?
    @objc dynamic var status : String?
    @objc dynamic var species : String?
    @objc dynamic var type : String?
    @objc dynamic var gender : String?
    @objc dynamic var origin : Origin? = Origin()
    @objc dynamic var location : Location? = Location()
    @objc dynamic var image : String?
    var episode = List<String>()
    @objc dynamic var url : String?
    @objc dynamic var created : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
        case status = "status"
        case species = "species"
        case type = "type"
        case gender = "gender"
        case origin = "origin"
        case location = "location"
        case image = "image"
        case episode = "episode"
        case url = "url"
        case created = "created"
    }

}
