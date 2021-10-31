//
//  FavoriteListCellExt.swift
//  RickAndMorty-Beta
//
//  Created by MacOS on 20.10.2021.
//

import Foundation
extension FavoritesListCell {

    func setUpFavoritesListCellContentView() {
        addSubview(favoritesListCellContentView)
        favoritesListCellContentView.setTop(equalTo: topAnchor)
        favoritesListCellContentView.setLeft(equalTo: leftAnchor, constant: 5)
        favoritesListCellContentView.setRight(equalTo: rightAnchor, constant: -5)
        favoritesListCellContentView.setBottom(equalTo: bottomAnchor)
        favoritesListCellContentView.setHeight(height: 375)
        favoritesListCellContentView.setWidth(width: 160)
        
        setUpCharacterImageView()
        setUpNameLabel()
        setUpStatusLabel()
        setUpSpeciesLabel()
        setUpDeleteFavoriteButton()
        
    }
    
    func setUpCharacterImageView()  {
        favoritesListCellContentView.addSubview(favoritesListCellImageView)
        favoritesListCellImageView.setTop(equalTo: favoritesListCellContentView.topAnchor, constant: 0)
        favoritesListCellImageView.setLeft(equalTo: favoritesListCellContentView.leftAnchor, constant: 0)
        favoritesListCellImageView.setRight(equalTo: favoritesListCellContentView.rightAnchor, constant: 0)
       // characterImageView.setWidth(width: 180)
    }
    
    func setUpNameLabel() {
        favoritesListCellContentView.addSubview(favoritesListCellNameLabel)
        favoritesListCellNameLabel.setTop(equalTo: favoritesListCellImageView.bottomAnchor, constant: 10)
        favoritesListCellNameLabel.setLeft(equalTo: favoritesListCellContentView.leftAnchor, constant: 10)
        favoritesListCellNameLabel.setRight(equalTo: favoritesListCellContentView.rightAnchor,constant: -10)

    }
    
    func setUpStatusLabel() {
        favoritesListCellContentView.addSubview(favoritesListCellStatusLabel)
        favoritesListCellStatusLabel.setTop(equalTo: favoritesListCellNameLabel.bottomAnchor, constant: 10)
        favoritesListCellStatusLabel.setLeft(equalTo: favoritesListCellContentView.leftAnchor, constant: 10)
        favoritesListCellStatusLabel.setRight(equalTo: favoritesListCellContentView.rightAnchor, constant: -10)
    }
    
    func setUpSpeciesLabel() {
        favoritesListCellContentView.addSubview(favoritesListCellSpeciesLabel)
        favoritesListCellSpeciesLabel.setTop(equalTo: favoritesListCellStatusLabel.bottomAnchor, constant: 10)
        favoritesListCellSpeciesLabel.setLeft(equalTo: favoritesListCellContentView.leftAnchor, constant: 10)
        favoritesListCellSpeciesLabel.setRight(equalTo: favoritesListCellContentView.rightAnchor, constant: -10)
        favoritesListCellSpeciesLabel.setBottom(equalTo: favoritesListCellContentView.bottomAnchor, constant: -10)
    }
    
    func setUpDeleteFavoriteButton()  {
        favoritesListCellContentView.addSubview(favoritesListCellDeleteFavoriteButton)
        favoritesListCellDeleteFavoriteButton.setTop(equalTo: favoritesListCellImageView.topAnchor, constant: 10)
        favoritesListCellDeleteFavoriteButton.setRight(equalTo: favoritesListCellContentView.rightAnchor, constant: -10)
        favoritesListCellDeleteFavoriteButton.setWidth(width: 30)
        favoritesListCellDeleteFavoriteButton.setHeight(height: 30)
    }
}
