//
//  FavoriteList.swift
//  RickAndMorty-Beta
//
//  Created by MacOS on 20.10.2021.
//


import Foundation
import UIKit
import Material

class FavoritesListView: UIView {
    
    lazy var favoritesListContentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var favoritesListToolBarView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var favoritesListListButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "goBack")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .red
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        return button
    }()
    
    lazy var favoritesListGridButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "list.png")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .red
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        return button
    }()
    
    lazy var favoritesListDeleteButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "delete")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .red
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        return button
    }()
    
    lazy var favoritesListToolBarLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var favoritesListCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpFavoritesListContentView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    
}
