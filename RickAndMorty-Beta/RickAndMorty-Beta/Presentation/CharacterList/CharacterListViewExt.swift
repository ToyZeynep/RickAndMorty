//
//  CharacterListViewExt.swift
//  RickAndMorty-Beta
//
//  Created by MacOS on 14.10.2021.
//

import Foundation
import UIKit
import Foundation

extension CharacterListView {
    func setUpCharacterListContentView()  {
        view.backgroundColor = UIColor(rgb: 0xF5F5F5)
        addSubview(characterListContentView)
        if #available(iOS 11.0, *) {
            characterListContentView.setTop(equalTo: safeAreaLayoutGuide.topAnchor)
        }
        characterListContentView.setLeft(equalTo: leftAnchor)
        characterListContentView.setRight(equalTo: rightAnchor)
        characterListContentView.setBottom(equalTo: bottomAnchor)
        
        setUpCharacterListToolBarView()
        setUpCharacterListToolBarLineView()
        setUpCharacterListCollectionView()
    }
    
    
    func setUpCharacterListToolBarView() {
        characterListContentView.addSubview(characterListToolBarView)
        characterListToolBarView.setTop(equalTo: characterListContentView.topAnchor)
        characterListToolBarView.setLeft(equalTo: characterListContentView.leftAnchor, constant: 15)
        characterListToolBarView.setRight(equalTo: characterListContentView.rightAnchor, constant: -15)
        characterListToolBarView.setHeight(height: 40)
        
        setUpCharacterListFavoritesButton()
        setUpCharacterListGridButton()
        setUpCharacterListFilterButton()
        
    }

    func setUpCharacterListFavoritesButton()  {
        characterListToolBarView.addSubview(characterListFavoritesButton)
        characterListFavoritesButton.setRight(equalTo: characterListToolBarView.rightAnchor, constant: -10)
        characterListFavoritesButton.setTop(equalTo:  characterListToolBarView.topAnchor, constant: 5)
        characterListFavoritesButton.setBottom(equalTo: characterListToolBarView.bottomAnchor, constant: -5)
        characterListFavoritesButton.setHeight(height: 30)
        characterListFavoritesButton.setWidth(width: 30)
        }
    
    func setUpCharacterListGridButton() {
        characterListToolBarView.addSubview(characterListGridButton)
        characterListGridButton.setRight(equalTo: characterListFavoritesButton.leftAnchor, constant: -10)
        characterListGridButton.setTop(equalTo:  characterListToolBarView.topAnchor, constant: 5)
        characterListGridButton.setBottom(equalTo: characterListToolBarView.bottomAnchor, constant: -5)
        characterListGridButton.setHeight(height: 30)
        characterListGridButton.setWidth(width: 30)
    }
    
    func setUpCharacterListFilterButton() {
        characterListToolBarView.addSubview(characterListFilterButton)
        characterListFilterButton.setRight(equalTo: characterListGridButton.leftAnchor, constant: -10)
        characterListFilterButton.setTop(equalTo:  characterListToolBarView.topAnchor, constant: 5)
        characterListFilterButton.setBottom(equalTo: characterListToolBarView.bottomAnchor, constant: -10)
        
        characterListFilterButton.setHeight(height: 30)
        characterListFilterButton.setWidth(width: 30)
    }
    
    func setUpCharacterListToolBarLineView() {
        characterListContentView.addSubview(characterListToolBarLineView)
        characterListToolBarLineView.setTop(equalTo: characterListToolBarView.bottomAnchor)
        characterListToolBarLineView.setLeft(equalTo: characterListContentView.leftAnchor)
        characterListToolBarLineView.setRight(equalTo: characterListContentView.rightAnchor)
        characterListToolBarLineView.setHeight(height: 1)
        
    }
    
    func setUpCharacterListCollectionView() {
        characterListContentView.addSubview(characterListCollectionView)
        characterListCollectionView.setTop(equalTo: characterListToolBarLineView.bottomAnchor, constant: 10)
        characterListCollectionView.setLeft(equalTo: characterListContentView.leftAnchor)
        characterListCollectionView.setRight(equalTo: characterListContentView.rightAnchor)
        characterListCollectionView.setBottom(equalTo: characterListContentView.bottomAnchor)
    }
}
