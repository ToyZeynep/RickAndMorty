//
//  CharacterListView.swift
//  RickAndMorty-Beta
//
//  Created by MacOS on 14.10.2021.
//

import Foundation
import UIKit
import Material

class CharacterListView: UIView {
    
    lazy var characterListContentView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(rgb: 0xF5F5F5)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    lazy var characterListToolBarView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(rgb: 0xF3F3F3)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var characterListFilterButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "filter.png")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
       // button.imageEdgeInsets = EdgeInsets(top: 5 , left: 5, bottom: 5, right: 5)
        button.clipsToBounds = true
        return button
    }()
    
    lazy var characterListGridButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "gridFill.png")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .black
        button.imageEdgeInsets = EdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        return button
    }()
    
    lazy var characterListFavoritesButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "favorite")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .black
        
        button.imageEdgeInsets = EdgeInsets(top: 3, left: 3, bottom: 3, right: 3)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        return button
    }()
    
    lazy var characterListToolBarLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var characterListCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpCharacterListContentView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
