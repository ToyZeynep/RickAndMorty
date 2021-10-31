//
//  AppCoordinator.swift
//  RickAndMorty-Beta
//
//  Created by MacOS on 14.10.2021.
//

import Foundation
import UIKit
import RxSwift
import XCoordinator

enum AppRoute: Route {
    case characterList
    case splash
}

class AppCoordinator: NavigationCoordinator<AppRoute> {
    
    init() {
        super.init(initialRoute: .splash)
    }
    
    override func prepareTransition(for route: AppRoute) -> NavigationTransition {
        switch route {
            
        case . splash :
            let viewController = SplashViewController()
            let viewModel = SplashViewModelImpl(router: unownedRouter)
            viewController.bind(to: viewModel)
            return .push(viewController, animation: .default)
            

        case .characterList:
            let coordinator = CharacterListCoordinator()
            return .presentFullScreen(coordinator, animation: .default)
            
        }
    }
}
