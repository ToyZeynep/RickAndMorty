//
//  SplashView.swift
//  RickAndMorty-Beta
//
//  Created by MacOS on 30.10.2021.
//

import Foundation
import UIKit
import Material

class SplashView: UIView {
    
    lazy var splashContentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var splashImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "splash.jpg")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpSplashContentView()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
