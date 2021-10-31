//
//  CharacterDetailsViewModelImpl.swift
//  RickAndMorty-Beta
//
//  Created by MacOS on 19.10.2021.

import Foundation
import RxSwift
import RxCocoa
import XCoordinator
import Action

class CharacterDetailViewModelImpl: CharacterDetailsViewModel, CharacterDetailsViewModelInput, CharacterDetailsViewModelOutput {
  
    let disposeBag = DisposeBag()
    
    // MARK: -Inputs-
    
    
    // MARK: -Actions-
    

    
    // MARK: -Outputs-
    var name   =  BehaviorSubject<String> (value: "")
    var status =   BehaviorSubject<String> (value: "")
    var species =   BehaviorSubject<String> (value: "")
    var type  =   BehaviorSubject<String> (value: "")
    var gender =  BehaviorSubject<String> (value: "")
   var origin =   BehaviorSubject<String> (value: "")
    var location =   BehaviorSubject<String> (value: "")
    var image =   BehaviorSubject<String> (value: "")
    var lastLocation =   BehaviorSubject<String> (value: "")
    var episodeCount =  BehaviorSubject<String> (value: "")
    var id = BehaviorSubject<Int>(value: 0)
    
    // MARK: -Stored properties-
    
    private let router: UnownedRouter<CharacterListRoute>
    private let characterDetail: CharacterDetails
    
    // MARK: -Initialization-
    
    init(router: UnownedRouter<CharacterListRoute>, characterDetail: CharacterDetails) {
        self.router = router
        self.characterDetail = characterDetail
        setCharacterDetail()
    }
    
    func setCharacterDetail() {
        name.onNext(characterDetail.name!)
        image.onNext(characterDetail.image!)
        status.onNext(characterDetail.status!)
        species.onNext(characterDetail.species!)
        //episodeCount.onNext("Episodes Count: \(characterDetail.episode!.count)")
        gender.onNext(characterDetail.gender!)
        origin.onNext((characterDetail.origin?.name)!)
        lastLocation.onNext((characterDetail.location?.name)!)
    }
}
