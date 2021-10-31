//
//  CharacterListViewModelImpl.swift
//  RickAndMorty-Beta
//
//  Created by MacOS on 14.10.2021.
//

import Foundation
import RxSwift
import RxCocoa
import XCoordinator
import Action

class CharacterListViewModelImpl: CharacterListViewModel, CharacterListViewModelInput, CharacterListViewModelOutput, CharacterListViewModelStoredProperties {

    private(set) lazy var selectedCharacter = selectedCharacterActions.inputs

    let disposeBag = DisposeBag()
    
    // MARK: -Inputs-

    
    // MARK: -Actions-

lazy var selectedCharacterActions = Action<CharacterDetails, Void> { [unowned self] characterDetail in
    self.router.rx.trigger(.characterDetail(characterDetail: characterDetail))
    }

    // MARK: -Outputs-
    var characterListResponse = PublishSubject<CharacterListResponse>()
    var characterList = PublishSubject<[CharacterDetails]>()    
    
    // MARK: -Stored properties-
    
    private let router : UnownedRouter<CharacterListRoute>
    var characterListUseCase = CharacterListUseCase()
    
    // MARK: -Initialization-
    
    init(router: UnownedRouter<CharacterListRoute> ) {
    self.router = router
        fetchCharacterList(pageNumber: 1)
    }
    func fetchCharacterList(pageNumber: Int) {
        var params: [String: Any] = [String: Any]()
        params["page"] = pageNumber
        characterListUseCase.getCharacterList(params: params).subscribe(onNext: { [self] response in
            if response.charactersDetails != nil {
                self.characterListResponse.onNext(response)

            }
        }).disposed(by: disposeBag)
    }
    
    func navigateToFavorites()  {
        router.trigger(.favoriteList)
    }
    
    func selectedStatusList(characterList : [CharacterDetails] , status : String) -> [CharacterDetails] {
        var deathList = [CharacterDetails]()
        var aliveList = [CharacterDetails]()
        var unKnownList = [CharacterDetails]()
        
        for character in characterList {
            if character.status == "Alive" {
                aliveList.append(character)
            } else if character.status == "Dead" {
                deathList.append(character)
            } else {
                unKnownList.append(character)
            }
        }
        
        switch status {
        case "Alive" :
            return aliveList
        case "Death" :
            return deathList
        case "Unknown" :
            return unKnownList
        default:
            return characterList
        }
    }
    
    func selectedSpeciesList( characterList : [CharacterDetails] ,species: String) -> [CharacterDetails]{
        var humanList = [CharacterDetails]()
        var animalList = [CharacterDetails]()
        var alienList = [CharacterDetails]()
        var humanoidList = [CharacterDetails]()
        
        for character in characterList {
            if character.species == "Human" {
                humanList.append(character)
            }
            else if character.species == "Animal"{
                animalList.append(character)
            }
            else if character.species == "Alien" {
                alienList.append(character)
            }
            else {
                humanoidList.append(character)
            }
        }
        
        switch species {
        case "Human" :
            return humanList
        case "Animal" :
            return animalList
        case "Humanoid" :
            return humanoidList
        case "Alien" :
            return alienList
        default:
            return characterList

        }
    }
    
    func selectedGenderList(characterList : [CharacterDetails] , gender : String) -> [CharacterDetails]{
        var maleList = [CharacterDetails]()
        var femaleList = [CharacterDetails]()

        
        for character in characterList {
            if character.gender == "Male" {
                maleList.append(character)
            }else{
                femaleList.append(character)
            }
        }
        
        switch gender {
        case "Male" :
            return maleList
        case "Female" :
            return femaleList
        default:
            return characterList
        }
    }
    
    func selectedSortList(characterList : [CharacterDetails] , sort : String) -> [CharacterDetails] {
        switch sort {
        case "Sort A-Z" :
            let sortAtoZList =  characterList.sorted(by:{ $0.name! < $1.name!})
            return sortAtoZList
        case "Sort Z-A" :
            let sortZtoAList = characterList.sorted(by: { $0.name! > $1.name!})
            return sortZtoAList
        default:
            return characterList
        }
    }
}
