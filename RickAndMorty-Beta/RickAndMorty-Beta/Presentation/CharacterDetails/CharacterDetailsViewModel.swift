//
//  CharacterDetailsViewModel.swift
//  RickAndMorty-Beta
//
//  Created by MacOS on 19.10.2021.
//

import Foundation
import RxSwift
import XCoordinator
import Action

protocol CharacterDetailsViewModelInput {
}

protocol CharacterDetailsViewModelOutput {
    var name   :  BehaviorSubject<String> { get }
    var status : BehaviorSubject<String> { get }
    var species : BehaviorSubject<String> { get }
    var type : BehaviorSubject<String> { get }
    var gender : BehaviorSubject<String> { get }
    var origin : BehaviorSubject<String> { get }
    var location : BehaviorSubject<String> { get }
    var image : BehaviorSubject<String> { get }
    var lastLocation : BehaviorSubject<String> { get }
    var episodeCount : BehaviorSubject<String> { get }
    var id : BehaviorSubject<Int> { get }
}

protocol CharacterDetailsViewModel {
    var input: CharacterDetailsViewModelInput { get }
    var output: CharacterDetailsViewModelOutput { get }
}

extension CharacterDetailsViewModel where Self: CharacterDetailsViewModelInput & CharacterDetailsViewModelOutput {
    var input: CharacterDetailsViewModelInput { return self }
    var output: CharacterDetailsViewModelOutput { return self }
}
