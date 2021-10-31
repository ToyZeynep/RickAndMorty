//
//  CharacterListCellExt.swift
//  RickAndMorty-Beta
//
//  Created by MacOS on 14.10.2021.
//

import Foundation
extension CharacterListCell {

    func setUpCharacterListCellContentView() {
        addSubview(characterListCellContentView)
        characterListCellContentView.setTop(equalTo: topAnchor)
        characterListCellContentView.setLeft(equalTo: leftAnchor, constant: 5)
        characterListCellContentView.setRight(equalTo: rightAnchor, constant: -5)
        characterListCellContentView.setBottom(equalTo: bottomAnchor)
        characterListCellContentView.setHeight(height: 375)
        characterListCellContentView.setWidth(width: 160)
        
        setUpCharacterImageView()
        setUpNameLabel()
        setUpStatusLabel()
        setUpSpeciesLabel()
        setUpFavoriteButton()
    }
    
    func setUpCharacterImageView()  {
        characterListCellContentView.addSubview(characterListCellImageView)
        characterListCellImageView.setTop(equalTo: characterListCellContentView.topAnchor, constant: 0)
        characterListCellImageView.setLeft(equalTo: characterListCellContentView.leftAnchor, constant: 0)
        characterListCellImageView.setRight(equalTo: characterListCellContentView.rightAnchor, constant: 0)
       // characterImageView.setWidth(width: 180)
    }
    
    func setUpNameLabel() {
        characterListCellContentView.addSubview(characterListCellNameLabel)
        characterListCellNameLabel.setTop(equalTo: characterListCellImageView.bottomAnchor, constant: 10)
        characterListCellNameLabel.setLeft(equalTo: characterListCellContentView.leftAnchor, constant: 10)
        characterListCellNameLabel.setRight(equalTo: characterListCellContentView.rightAnchor,constant: -10)

    }
    
    func setUpStatusLabel() {
        characterListCellContentView.addSubview(characterListCellStatusLabel)
        characterListCellStatusLabel.setTop(equalTo: characterListCellNameLabel.bottomAnchor, constant: 10)
        characterListCellStatusLabel.setLeft(equalTo: characterListCellContentView.leftAnchor, constant: 10)
        characterListCellStatusLabel.setRight(equalTo: characterListCellContentView.rightAnchor, constant: -10)
    }
    
    func setUpSpeciesLabel() {
        characterListCellContentView.addSubview(characterListCellSpeciesLabel)
        characterListCellSpeciesLabel.setTop(equalTo: characterListCellStatusLabel.bottomAnchor, constant: 10)
        characterListCellSpeciesLabel.setLeft(equalTo: characterListCellContentView.leftAnchor, constant: 10)
        characterListCellSpeciesLabel.setRight(equalTo: characterListCellContentView.rightAnchor, constant: -10)
        characterListCellSpeciesLabel.setBottom(equalTo: characterListCellContentView.bottomAnchor, constant: -10)
    }
    
    func setUpFavoriteButton()  {
        characterListCellContentView.addSubview(characterListCellAddFavoriteButton)
        characterListCellAddFavoriteButton.setTop(equalTo: characterListCellImageView.topAnchor, constant: 10)
        characterListCellAddFavoriteButton.setRight(equalTo: characterListCellContentView.rightAnchor, constant: -10)
        characterListCellAddFavoriteButton.setWidth(width: 30)
        characterListCellAddFavoriteButton.setHeight(height: 30)
    }
}
