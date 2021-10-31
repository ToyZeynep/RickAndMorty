//
//  CharacterListViewController.swift
//  RickAndMorty-Beta
//
//  Created by MacOS on 14.10.2021.
//

import Foundation
import RxCocoa
import RxSwift
import RxGesture
import XCoordinator
import Kingfisher
import Action
import UIKit
import RealmSwift
import McPicker
class CharacterListViewController : UIViewController, BindableType, UICollectionViewDelegate{
    private let cellIdentifier = String(describing: CharacterListCell.self)
    let disposeBag = DisposeBag()
    var characterListView = CharacterListView()
    var viewModel: CharacterListViewModel!
    var gridFlowLayout = GridFlowLayout()
    var listFlowLayout = ListFlowLayout()
    var characterList = [CharacterDetails]()
    var sortedCharacterList = [CharacterDetails]()
    var nextPage = 0
    var filteredCharacterList = [CharacterDetails]()
    var filterList = [ "Status" , "Species" , "Gender", "Sort"]
    var isLoading = false
    var isGrid = true
    var isFilterButtonTapped = true
    
    override func loadView() {
        view = characterListView
    }
    
    override func viewDidLoad() {
        registerCollectionView()
        //   let favorites : [CharacterDetails] = RealmHelper.sharedInstance.fetchFavoriteList().map { $0 }
        
        //     var i = 0
        //  while i<favorites.count{
        //      print("name: ",favorites[i].name as Any)
        //      i = i + 1
        //   }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        characterListView.characterListCollectionView.reloadData()
        navigationController?.navigationBar.backgroundColor = UIColor(rgb: 0xF5F5F5)

        
    }
    @objc func favoriteTapped(){
        self.viewModel.navigateToFavorites()
    }
    @objc func filterTapped(){
        self.showPicker(self.characterListView.characterListFilterButton, list: self.filterList)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func bindViewModel() {
        
        viewModel.output.characterListResponse.subscribe(onNext: { response in
            self.characterList.append(contentsOf: response.charactersDetails!)
            self.viewModel.output.characterList.onNext(self.characterList)
            self.nextPage = (response.info?.getNextPageNumber())!
            self.isLoading = false
        }).disposed(by: disposeBag)
        
        viewModel.output.characterList.bind(to: characterListView.characterListCollectionView.rx.items(cellIdentifier: cellIdentifier,cellType: CharacterListCell.self)) { _, model, cell in
            
            let urlString = model.image!.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            cell.characterListCellImageView.kf.setImage(with: URL(string: urlString!))
            cell.characterListCellNameLabel.text = model.name
            cell.characterListCellStatusLabel.text = model.status
            cell.characterListCellSpeciesLabel.text = model.species
            cell.characterListCellAddFavoriteButton.rx.tapGesture().when(.recognized).subscribe(onNext: {gesture in
                let favoriteList = RealmHelper.sharedInstance.fetchFavoriteList().map { $0 }
                if let position = favoriteList.firstIndex(where: {$0.id == model.id}){
                    RealmHelper.sharedInstance.deleteFromDb(characterDetails: favoriteList[position])
                    AppSnackBar.make(in: self.view, message: "\(model.name!) favorilerden çıkarıldı ", duration: .custom(1.0)).show()
                    cell.characterListCellAddFavoriteButton.backgroundColor = .clear
                }else{
                    RealmHelper.sharedInstance.addCharacterToFavorites(characterDetails: model)
                    AppSnackBar.make(in: self.view, message: "\(model.name!) favorilere eklendi", duration: .custom(1.0)).show()
                    cell.characterListCellAddFavoriteButton.backgroundColor = .red
                }
            }).disposed(by: cell.disposeBag)
            
            self.favoriCharacterStatus(cell: cell, model: model)
            
        } .disposed(by: disposeBag)
        
        characterListView.characterListFavoritesButton.rx.tapGesture().when(.recognized).subscribe(onNext: { gesture in
            self.viewModel.navigateToFavorites()
        }).disposed(by: disposeBag)
        
        characterListView.characterListCollectionView.rx.modelSelected(CharacterDetails.self)
            .bind(to: viewModel.input.selectedCharacter).disposed(by: disposeBag)
        
        characterListView.characterListGridButton.rx.tapGesture().when(.recognized).subscribe(onNext: { gesture in
            
            self.gridButtonProcesses()
            
        }).disposed(by: disposeBag)
        
        
        characterListView.characterListFilterButton.rx.tapGesture().when(.recognized).subscribe(onNext: { gesture in
            self.showPicker(self.characterListView.characterListFilterButton, list: self.filterList)
        })
        
    }
    func registerCollectionView() {
        characterListView.characterListCollectionView.delegate = self
        characterListView.characterListCollectionView.register(CharacterListCell.self, forCellWithReuseIdentifier: "CharacterListCell")
        characterListView.characterListCollectionView.collectionViewLayout = gridFlowLayout
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if !isLoading {
            if (indexPath.row == characterList.count - 1) && (characterList.count % 20 == 0) && nextPage != 0 {
                viewModel.fetchCharacterList(pageNumber: nextPage)
                isLoading = true
            }
        }
    }
    
    func favoriCharacterStatus(cell: CharacterListCell, model: CharacterDetails) {
        let favoriteList = RealmHelper.sharedInstance.fetchFavoriteList().map { $0 }
        if let position = favoriteList.firstIndex(where: {$0.id == model.id}){
            cell.characterListCellAddFavoriteButton.backgroundColor = .red
        } else {
            cell.characterListCellAddFavoriteButton.backgroundColor = .clear
        }
    }
    func sortButtonProcesses (){
        print("filterButton tapped")
        self.isFilterButtonTapped ?  self.viewModel.output.characterList.onNext(self.sortedCharacterList.sorted(by: { $0.name! > $1.name! })) :  self.viewModel.output.characterList.onNext(self.sortedCharacterList.sorted(by: { $0.name! < $1.name! }))
        self.characterListView.characterListCollectionView.reloadData()
        self.isFilterButtonTapped = !self.isFilterButtonTapped
    }
    func gridButtonProcesses(){
        self.characterListView.characterListCollectionView.collectionViewLayout = self.isGrid ? self.listFlowLayout : self.gridFlowLayout
        self.characterListView.characterListGridButton.setImage( self.isGrid ? UIImage(named: "list2.png")?.withRenderingMode(.alwaysTemplate) : UIImage(named: "grid2.png")?.withRenderingMode(.alwaysTemplate), for: .normal)
        self.isGrid = !self.isGrid
        
    }
    
    func showPicker(_ sender: UIButton, list: [String]){
        McPicker.showAsPopover(data:[list], fromViewController: self, sourceView: sender, doneHandler: { [weak self] (selections: [Int : String]) -> Void in
            if let name = selections[0] {
                print(name)
                
                switch name {
                case "Status" :
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        let statusList = ["Alive", "Death" , "Unknown"]
                        self!.showPicker(sender, list: statusList)
                    }
                case "Species" :
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        let speciesList = ["Human" , "Alien" , "Animal " ,"Humanoid"  ]
                        self!.showPicker(sender, list: speciesList)
                    }
                case "Gender" :
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        let genderList = ["Male" , "Female"]
                        self?.showPicker(sender, list: genderList)
                    }
                case "Sort" :
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        let sortList = ["Sort A-Z" , "Sort Z-A"]
                        self?.showPicker(sender, list: sortList)
                    }
                    
                case "Alive" :
                    self!.viewModel.output.characterList.onNext((self!.viewModel.selectedStatusList(characterList: self!.characterList, status: "Alive")))
                    
                case  "Death" :
                    self!.viewModel.output.characterList.onNext((self!.viewModel.selectedStatusList(characterList: self!.characterList, status: "Death")))
                    
                case  "Unknown" :
                    self!.viewModel.output.characterList.onNext((self!.viewModel.selectedStatusList(characterList: self!.characterList, status: "Unknown")))
                    
                case  "Human" :
                    self!.viewModel.output.characterList.onNext((self!.viewModel.selectedSpeciesList(characterList: self!.characterList, species: "Human")))
                case  "Alien" :
                    self!.viewModel.output.characterList.onNext((self!.viewModel.selectedSpeciesList(characterList: self!.characterList, species: "Alien")))
                case  "Animal" :
                    self!.viewModel.output.characterList.onNext((self!.viewModel.selectedSpeciesList(characterList: self!.characterList, species: "Animal")))
                case  "Humanoid" :
                    self!.viewModel.output.characterList.onNext((self!.viewModel.selectedSpeciesList(characterList: self!.characterList, species: "Humanoid")))
                case  "Male" :
                    self!.viewModel.output.characterList.onNext((self!.viewModel.selectedGenderList(characterList: self!.characterList, gender: "Male")))
                case  "Female" :
                    self!.viewModel.output.characterList.onNext((self!.viewModel.selectedGenderList(characterList: self!.characterList, gender: "Female")))
                case  "Sort A-Z" :
                    self!.viewModel.output.characterList.onNext((self!.viewModel.selectedSortList(characterList: self!.characterList, sort: "Sort A-Z")))
                case  "Sort Z-A" :
                    self!.viewModel.output.characterList.onNext((self!.viewModel.selectedSortList(characterList: self!.characterList, sort: "Sort Z-A")))
                default: break
                }
            }
        })
    }
}
