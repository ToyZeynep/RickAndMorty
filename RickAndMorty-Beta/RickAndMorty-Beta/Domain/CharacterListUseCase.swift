//
//  CharacterListUseCase.swift
//  RickAndMorty-Beta
//
//  Created by MacOS on 14.10.2021.
//

import Foundation
import RxSwift
import RxCocoa

protocol CharacterListUseCaseType {
    
    func getCharacterList(params: [String: Any]) -> Observable<CharacterListResponse>
}

struct CharacterListUseCase: CharacterListUseCaseType {
    func getCharacterList(params: [String : Any]) -> Observable<CharacterListResponse> {
        return ApiClient.getCharacterList(params: params)
    }

}
