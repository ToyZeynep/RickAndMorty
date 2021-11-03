//
//  SplashView.swift
//  RickAndMorty-Beta
//
//  Created by MacOS on 30.10.2021.
//

import Foundation
import UIKit
import Material
import SwiftGifOrigin
class SplashView: UIView {
    
    lazy var splashContentView: UIView = {
        let view = UIView()
        view.backgroundColor =  UIColor(rgb: 0x0f0e0d)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var splashImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.loadGif(asset: "splashGif")
            imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
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
