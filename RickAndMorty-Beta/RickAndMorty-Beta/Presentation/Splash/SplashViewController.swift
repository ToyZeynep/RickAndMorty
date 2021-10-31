//
//  SplashViewController.swift
//  RickAndMorty-Beta
//
//  Created by MacOS on 30.10.2021.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift
import XCoordinator

class SplashViewController: UIViewController,BindableType {
    
    private let disposeBag = DisposeBag()
    var splashView = SplashView()
    var viewModel: SplashViewModel!
    
    override func loadView() {
        view = splashView
    }
    
    override func viewDidLoad() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.viewModel.navigateToCharacterList()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func bindViewModel() {
        
        
    }
}
