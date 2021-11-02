//
//  CharacterDetailsViewController.swift
//  RickAndMorty-Beta
//
//  Created by MacOS on 19.10.2021.
//

import UIKit
import RxCocoa
import RxSwift
import RxGesture
import XCoordinator
import Kingfisher
import Action

class CharacterDetailViewController: UIViewController, BindableType, UICollectionViewDelegate {
    
    let disposeBag = DisposeBag()
    var characterDetailView = CharacterDetailsView()
    var viewModel: CharacterDetailsViewModel!
    
    
    override func loadView() {
        view = characterDetailView
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.tintColor = .black
    }
    
    
    override func viewDidLoad() {
    }

func bindViewModel() {
    
    viewModel.output.name.bind(to: characterDetailView.characterDetailsNameLabel.rx.text).disposed(by: disposeBag)
    viewModel.output.status.bind(to: characterDetailView.characterDetailsStatusLabel.rx.text).disposed(by: disposeBag)
    viewModel.output.species.bind(to: characterDetailView.characterDetailsSpeciesLabel.rx.text).disposed(by: disposeBag)
    viewModel.output.gender.bind(to: characterDetailView.characterDetailsGenderLabel.rx.text).disposed(by: disposeBag)
    viewModel.output.origin.bind(to: characterDetailView.characterDetailsLocationLabel.rx.text).disposed(by: disposeBag)
    viewModel.output.lastLocation.bind(to: characterDetailView.characterDetailsLastLocationLabel.rx.text).disposed(by: disposeBag)
    viewModel.output.episodeCount.bind(to: characterDetailView.characterDetailsEpisodesCountLabel.rx.text).disposed(by: disposeBag)
    viewModel.output.image.subscribe(onNext: { [unowned self] (imageUrl) in
        self.characterDetailView.characterDetailsImageView.kf.setImage(with: URL(string: imageUrl))
    }).disposed(by: disposeBag)

   }
}
