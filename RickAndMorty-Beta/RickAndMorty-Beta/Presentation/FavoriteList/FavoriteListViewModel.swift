//
//  FavoriteListViewModel.swift
//  RickAndMorty-Beta
//
//  Created by MacOS on 20.10.2021.
//

import Foundation
import RxSwift
import XCoordinator
import Action
import RealmSwift

protocol FavoritesListViewModelInput {
    
  var selectedCharacter: AnyObserver<CharacterDetails> { get }
}
protocol  FavoritesListViewModelOutput {

    var favoritesList: PublishSubject<[CharacterDetails]> { get }
    
}
protocol  FavoritesListViewModelStoredProperties {
 
}

protocol  FavoritesListViewModel {
    var input: FavoritesListViewModelInput { get }
    var output: FavoritesListViewModelOutput { get }
    var storedProperties : FavoritesListViewModelStoredProperties { get }
    func fetchFavoriteList()
    func dismiss()
 
}

extension  FavoritesListViewModel where Self: FavoritesListViewModelInput & FavoritesListViewModelOutput & FavoritesListViewModelStoredProperties {
    var input: FavoritesListViewModelInput { return self }
    var output: FavoritesListViewModelOutput { return self }
    var storedProperties: FavoritesListViewModelStoredProperties { return self }
}
