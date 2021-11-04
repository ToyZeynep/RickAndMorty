//
//  SplashViewModelImpl.swift
//  RickAndMorty-Beta
//
//  Created by MacOS on 30.10.2021.
//
import Foundation
import RxSwift
import RxCocoa
import XCoordinator

class SplashViewModelImpl: SplashViewModel, SplashViewModelInput, SplashViewModelOutput {
    
    // MARK: -Inputs-
    
    // MARK: -Outputs-
    
    // MARK: -Stored properties-
    
    private let router: UnownedRouter<AppRoute>
    
    // MARK: -Initialization-
    
    init(router: UnownedRouter<AppRoute>) {
        self.router = router
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
           self.navigateToCharacterList()
        }
    }
    
    func navigateToCharacterList() {
        router.trigger(.characterList)
    }
}
