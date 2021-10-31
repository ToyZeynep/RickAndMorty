//
//  CharacterListResponse.swift
//  RickAndMorty-Beta
//
//  Created by MacOS on 15.10.2021.
//

import Foundation
struct CharacterListResponse : Codable {
    let info : Info?
    let charactersDetails : [CharacterDetails]?

    enum CodingKeys: String, CodingKey {

        case info = "info"
        case charactersDetails = "results"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        info = try values.decodeIfPresent(Info.self, forKey: .info)
        charactersDetails = try values.decodeIfPresent([CharacterDetails].self, forKey: .charactersDetails)
    }

}
