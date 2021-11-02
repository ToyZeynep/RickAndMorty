//
//  CharacterListCoordinator.swift
//  RickAndMorty-Beta
//
//  Created by MacOS on 19.10.2021.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import XCoordinator

enum CharacterListRoute: Route {
    
    case characterList
    case characterDetail(characterDetail: CharacterDetails)
    case favoriteList
    case pop
}

class CharacterListCoordinator: NavigationCoordinator<CharacterListRoute> {
    
    init() {
        super.init(initialRoute: .characterList)
    }
    
    override func prepareTransition(for route: CharacterListRoute) -> NavigationTransition {
        switch route {
 
       case .characterList:
            let viewController = CharacterListViewController()
            let viewModel = CharacterListViewModelImpl(router: unownedRouter)
            viewController.bind(to: viewModel)
        return .push(viewController, animation: .default)
     
      case .characterDetail(let characterDetail):
            let viewController = CharacterDetailViewController()
            let viewModel = CharacterDetailViewModelImpl(router: unownedRouter, characterDetail: characterDetail)
            viewController.bind(to: viewModel)
            viewController.title = "Details"
            return .push(viewController, animation: .default)
 
        case .favoriteList:
            let viewController = FavoritesListViewController()
            let viewModel = FavoriteListViewModelImpl(router: unownedRouter)
            viewController.bind(to: viewModel)
            viewController.title = "Favorites"
            return .push(viewController, animation: .default)
            
        case .pop :
            return .pop(animation: .default)
        }
    }
}
