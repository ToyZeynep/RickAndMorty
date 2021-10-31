//
//  ViewExt.swift
//  RickAndMorty-Beta
//
//  Created by MacOS on 14.10.2021.
//

import Foundation
import UIKit

extension UIView {
    
    func setTop(equalTo : NSLayoutYAxisAnchor, constant : CGFloat = 0){
        self.topAnchor.constraint(equalTo: equalTo, constant: constant).isActive = true
    }
    
    func setBottom(equalTo : NSLayoutYAxisAnchor, constant : CGFloat = 0){
        self.bottomAnchor.constraint(equalTo: equalTo, constant: constant).isActive = true
    }
    
    func setLeft(equalTo : NSLayoutXAxisAnchor, constant : CGFloat = 0){
        self.leftAnchor.constraint(equalTo: equalTo, constant: constant).isActive = true
    }
    
    func setRight(equalTo : NSLayoutXAxisAnchor, constant : CGFloat = 0){
        self.rightAnchor.constraint(equalTo: equalTo, constant: constant).isActive = true
    }
    
    func setCenterX(equalTo : NSLayoutXAxisAnchor, constant : CGFloat = 0){
        self.centerXAnchor.constraint(equalTo: equalTo, constant: constant).isActive = true
    }
    
    func setCenterY(equalTo : NSLayoutYAxisAnchor, constant : CGFloat = 0){
        self.centerYAnchor.constraint(equalTo: equalTo, constant: constant).isActive = true
    }
    
    func setHeight(height : CGFloat){
        self.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    func setWidth(width : CGFloat){
        self.widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
    func setWidthAnchor(equalTo : NSLayoutDimension, constant : CGFloat = 0){
        self.widthAnchor.constraint(equalTo: equalTo).isActive = true
    }
    
    func setHeightAnchor(equalTo : NSLayoutDimension, constant : CGFloat = 0){
        self.heightAnchor.constraint(equalTo: equalTo).isActive = true
    }
    
    enum Visibility {
        case visible
        case invisible
        case gone
    }
    
    var visibility: Visibility {
        get {
            let constraint = (self.constraints.filter{$0.firstAttribute == .height && $0.constant == 0}.first)
            if let constraint = constraint, constraint.isActive {
                return .gone
            } else {
                return self.isHidden ? .invisible : .visible
            }
        }
        set {
            if self.visibility != newValue {
                self.setVisibility(newValue)
            }
        }
    }
    
    private func setVisibility(_ visibility: Visibility) {
        let constraint = (self.constraints.filter{$0.firstAttribute == .height && $0.constant == 0}.first)
        
        switch visibility {
        case .visible:
            constraint?.isActive = false
            self.isHidden = false
            break
        case .invisible:
            constraint?.isActive = false
            self.isHidden = true
            break
        case .gone:
            if let constraint = constraint {
                constraint.isActive = true
            } else {
                let constraint = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 0)
                self.addConstraint(constraint)
                constraint.isActive = true
            }
        }
    }
    
    var heightConstaint: NSLayoutConstraint? {
        get {
            return constraints.first(where: {
                $0.firstAttribute == .height && $0.relation == .equal
            })
        }
        set { setNeedsLayout() }
    }
    
    var widthConstaint: NSLayoutConstraint? {
        get {
            return constraints.first(where: {
                $0.firstAttribute == .width && $0.relation == .equal
            })
        }
        set { setNeedsLayout() }
    }
    
 
}

extension UIView {
    
    func addTapGesture(action : @escaping ()->Void ){
        let tap = MyTapGestureRecognizer(target: self , action: #selector(self.handleTap(_:)))
        tap.action = action
        tap.numberOfTapsRequired = 1
        
        self.addGestureRecognizer(tap)
        self.isUserInteractionEnabled = true
        
    }
    @objc func handleTap(_ sender: MyTapGestureRecognizer) {
        sender.action!()
    }
}

extension UIView {
    func setGradientBackground() {
        let colorTop =  UIColor(red: 255.0/255.0, green: 149.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 255.0/255.0, green: 94.0/255.0, blue: 58.0/255.0, alpha: 1.0).cgColor

        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = bounds
        self.layer.insertSublayer(gradientLayer, at:0)
    }
}

class MyTapGestureRecognizer: UITapGestureRecognizer {
    var action : (()->Void)? = nil
}

extension UIView {
    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
}
