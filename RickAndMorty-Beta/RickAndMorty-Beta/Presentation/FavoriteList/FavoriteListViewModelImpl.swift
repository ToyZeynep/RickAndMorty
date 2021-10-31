//
//  FavoriteListViewModelImpl.swift
//  RickAndMorty-Beta
//
//  Created by MacOS on 20.10.2021.
//

import Foundation
import RxSwift
import RxCocoa
import XCoordinator
import Action
import RealmSwift

class FavoriteListViewModelImpl: FavoritesListViewModel, FavoritesListViewModelInput, FavoritesListViewModelOutput, FavoritesListViewModelStoredProperties {
    
    let disposeBag = DisposeBag()
    
    // MARK: -Inputs-
    
    private(set) lazy var selectedCharacter = selectedCharacterActions.inputs
    
    // MARK: -Actions-
    
    lazy var selectedCharacterActions = Action<CharacterDetails, Void> { [unowned self] characterDetail in
        self.router.rx.trigger(.characterDetail(characterDetail: characterDetail))
    }
    
    // MARK: -Outputs-
    var favoritesList = PublishSubject<[CharacterDetails]>()
    
    // MARK: -Stored properties-
    
    private let router : UnownedRouter<CharacterListRoute>
    
    
    // MARK: -Initialization-
    
    init(router: UnownedRouter<CharacterListRoute> ) {
        self.router = router
        fetchFavoriteList()
    }

    func fetchFavoriteList() {
        DispatchQueue.main.async {
            let favoriList = RealmHelper.sharedInstance.fetchFavoriteList().map { $0 }
            var list:[CharacterDetails] = [CharacterDetails]()
            list.append(contentsOf: favoriList)
            self.favoritesList.onNext(list)
        }
    
    }
    func dismiss() {
        router.trigger(.pop)
    }
}
