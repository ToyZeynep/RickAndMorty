//
//  SplashViewModel.swift
//  RickAndMorty-Beta
//
//  Created by MacOS on 30.10.2021.
//

import Foundation
import RxSwift
import XCoordinator
import Action

protocol SplashViewModelInput {
    
}

protocol SplashViewModelOutput {
    
}

protocol SplashViewModel {
    var input: SplashViewModelInput { get }
    var output: SplashViewModelOutput { get }
    
    func navigateToCharacterList()
}

extension SplashViewModel where Self: SplashViewModelInput & SplashViewModelOutput {
    var input: SplashViewModelInput { return self }
    var output: SplashViewModelOutput { return self }
}
