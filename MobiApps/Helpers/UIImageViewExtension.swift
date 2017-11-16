//
//  UIImageViewExtension.swift
//  HenriPotierLibrary
//
//  Created by Ahmed K on 23/04/2017.
//  Copyright © 2017 Ahmed K. All rights reserved.
//
import Foundation
import Kingfisher

extension UIImageView {

    func imageFromUrl(_ url: String) {

        let _url = URL(string: url)!
        self.kf.setImage(with: _url, placeholder: nil, options: nil, progressBlock: nil, completionHandler: nil)
    }

    func imageFromUrl(_ url: String, _ indicatorColor: UIColor) {

        let _url = URL(string: url)!

        //Display white indicator
        self.kf.indicatorType = .activity
        (self.kf.indicator?.view as? UIActivityIndicatorView)?.color = indicatorColor

        self.kf.setImage(with: _url, placeholder: nil, options: nil, progressBlock: nil, completionHandler: nil)
    }

}
