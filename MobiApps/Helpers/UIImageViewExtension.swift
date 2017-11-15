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

    func imageFromUrl(_ url: String, _ placeHolder: UIImage? = nil) {

        let _url = URL(string: url)!

        self.kf.setImage(with: _url, placeholder: placeHolder, options: nil, progressBlock: nil, completionHandler: nil)

    }

}
