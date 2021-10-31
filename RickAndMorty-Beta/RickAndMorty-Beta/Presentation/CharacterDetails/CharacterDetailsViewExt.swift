//
//  CharacterDetailsViewExtension.swift
//  RickAndMorty-Beta
//
//  Created by MacOS on 19.10.2021.
//

import UIKit
import Foundation

extension CharacterDetailsView {
    func setUpCharacterDetailsContentView()  {
        view.backgroundColor = UIColor(rgb: 0xF5F5F5)
        addSubview(characterDetailsContentView)
        if #available(iOS 11.0, *) {
            characterDetailsContentView.setTop(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20)
        } else {
        }
        characterDetailsContentView.setLeft(equalTo: leftAnchor, constant: 30)
        characterDetailsContentView.setRight(equalTo: rightAnchor, constant: -30)
        characterDetailsContentView.setBottom(equalTo: bottomAnchor, constant: -30)
        
        setUptoolBarLineView()
        setUpLogoImageView()
        setUpCharacterImageView()
        setUpNameLabel()
        setUpStatusLabel()
        setUpSpeciesLabel()
        setUpGenderLabel()
        setUpLocationLabel()
        setUpLastLocationLabel()
        setUpEpisodesNumberLabel()
    }
    
    func setUptoolBarLineView() {
        addSubview(characterDetailsToolBarLineView)
        characterDetailsToolBarLineView.setTop(equalTo: safeAreaLayoutGuide.topAnchor)
        characterDetailsToolBarLineView.setLeft(equalTo: leftAnchor)
        characterDetailsToolBarLineView.setRight(equalTo: rightAnchor)
        characterDetailsToolBarLineView.setHeight(height: 1)
    }
    
    func setUpLogoImageView() {
        characterDetailsContentView.addSubview(characterDetailsLogoImageView)
        characterDetailsLogoImageView.setTop(equalTo: characterDetailsContentView.topAnchor, constant: 20)
        characterDetailsLogoImageView.setCenterX(equalTo: characterDetailsContentView.centerXAnchor)
        characterDetailsLogoImageView.setWidth(width: 250)
        characterDetailsLogoImageView.setHeight(height: 100)
    }
    
    func  setUpCharacterImageView() {
        characterDetailsContentView.addSubview(characterDetailsImageView)
        characterDetailsImageView.setTop(equalTo: characterDetailsLogoImageView.bottomAnchor, constant: 20)
        characterDetailsImageView.setCenterX(equalTo: characterDetailsContentView.centerXAnchor)
        characterDetailsImageView.setHeight(height: 200)
        characterDetailsImageView.setWidth(width: 200)
    }
    
    func setUpNameLabel() {
        characterDetailsContentView.addSubview(characterDetailsNameLabel)
        characterDetailsNameLabel.setTop(equalTo: characterDetailsImageView.bottomAnchor, constant: 20)
        characterDetailsNameLabel.setLeft(equalTo: characterDetailsContentView.leftAnchor, constant: 20)
        characterDetailsNameLabel.setRight(equalTo: characterDetailsContentView.rightAnchor, constant: -20)
    }
    
    func setUpStatusLabel() {
        characterDetailsContentView.addSubview(characterDetailsStatusLabel)
        characterDetailsStatusLabel.setTop(equalTo: characterDetailsNameLabel.bottomAnchor, constant: 20)
        characterDetailsStatusLabel.setLeft(equalTo: characterDetailsContentView.leftAnchor, constant: 20)
        characterDetailsStatusLabel.setRight(equalTo: characterDetailsContentView.rightAnchor, constant: -20)
    }
    
    func setUpSpeciesLabel() {
        characterDetailsContentView.addSubview(characterDetailsSpeciesLabel)
        characterDetailsSpeciesLabel.setTop(equalTo: characterDetailsStatusLabel.bottomAnchor, constant: 20)
        characterDetailsSpeciesLabel.setLeft(equalTo: characterDetailsContentView.leftAnchor, constant: 20)
        characterDetailsSpeciesLabel.setRight(equalTo: characterDetailsContentView.rightAnchor, constant: -20)
    }
    
    func setUpGenderLabel() {
        characterDetailsContentView.addSubview(characterDetailsGenderLabel)
        characterDetailsGenderLabel.setTop(equalTo: characterDetailsSpeciesLabel.bottomAnchor, constant: 20)
        characterDetailsGenderLabel.setLeft(equalTo: characterDetailsContentView.leftAnchor, constant: 20)
        characterDetailsGenderLabel.setRight(equalTo: characterDetailsContentView.rightAnchor, constant: -20)
    }
    
    func setUpLocationLabel() {
        characterDetailsContentView.addSubview(characterDetailsLocationLabel)
        characterDetailsLocationLabel.setTop(equalTo: characterDetailsGenderLabel.bottomAnchor, constant: 20)
        characterDetailsLocationLabel.setLeft(equalTo: characterDetailsContentView.leftAnchor, constant: 20)
        characterDetailsLocationLabel.setRight(equalTo: characterDetailsContentView.rightAnchor, constant: -20)
    }
    
    func setUpLastLocationLabel() {
        characterDetailsContentView.addSubview(characterDetailsLastLocationLabel)
        characterDetailsLastLocationLabel.setTop(equalTo: characterDetailsLocationLabel.bottomAnchor, constant: 20)
        characterDetailsLastLocationLabel.setLeft(equalTo: characterDetailsContentView.leftAnchor, constant: 20)
        characterDetailsLastLocationLabel.setRight(equalTo: characterDetailsContentView.rightAnchor, constant: -20)
    }
    
    func setUpEpisodesNumberLabel() {
        characterDetailsContentView.addSubview(characterDetailsEpisodesCountLabel)
        characterDetailsEpisodesCountLabel.setTop(equalTo: characterDetailsLastLocationLabel.bottomAnchor, constant: 20)
        characterDetailsEpisodesCountLabel.setLeft(equalTo: characterDetailsContentView.leftAnchor, constant: 20)
        characterDetailsEpisodesCountLabel.setRight(equalTo: characterDetailsContentView.rightAnchor, constant: -20)
    }
 
}
