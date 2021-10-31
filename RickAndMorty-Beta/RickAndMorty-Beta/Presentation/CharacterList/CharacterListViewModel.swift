//
//  CharacterListViewModel.swift
//  RickAndMorty-Beta
//
//  Created by MacOS on 14.10.2021.
//

import Foundation
import RxSwift
import XCoordinator
import Action

protocol CharacterListViewModelInput {
    
  var selectedCharacter: AnyObserver<CharacterDetails> { get }
}
protocol CharacterListViewModelOutput {
    var characterListResponse: PublishSubject<CharacterListResponse> { get }
    var characterList: PublishSubject<[CharacterDetails]> { get }
    
}
protocol CharacterListViewModelStoredProperties {
    var characterListUseCase : CharacterListUseCase { get }
    
}

protocol CharacterListViewModel {
    var input: CharacterListViewModelInput { get }
    var output: CharacterListViewModelOutput { get }
    var storedProperties : CharacterListViewModelStoredProperties { get }
    func fetchCharacterList(pageNumber: Int)
    func navigateToFavorites()
    func selectedSortList(characterList : [CharacterDetails] , sort : String) -> [CharacterDetails]
    func selectedGenderList(characterList : [CharacterDetails] , gender : String) -> [CharacterDetails]
    func selectedSpeciesList( characterList : [CharacterDetails] ,species: String) -> [CharacterDetails]
    func selectedStatusList(characterList : [CharacterDetails] , status : String) -> [CharacterDetails]
    
}

extension CharacterListViewModel where Self: CharacterListViewModelInput & CharacterListViewModelOutput & CharacterListViewModelStoredProperties {
    var input: CharacterListViewModelInput { return self }
    var output: CharacterListViewModelOutput { return self }
    var storedProperties: CharacterListViewModelStoredProperties { return self }
}
