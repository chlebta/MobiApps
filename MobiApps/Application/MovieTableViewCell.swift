//
//  MovieTableViewCell.swift
//  MobiApps
//
//  Created by Wael on 15/11/2017.
//  Copyright © 2017 MobiApps. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!

    @IBOutlet weak var noteLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!

    @IBOutlet weak var descriptionLabel: UILabel!

    @IBOutlet weak var posterImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        backgroundColor = Colors.primaryBackgroundColor
        titleLabel.textColor = Colors.light
        dateLabel.textColor = Colors.gray
        descriptionLabel.textColor = Colors.gray
        noteLabel.layer.cornerRadius = 2
        noteLabel.clipsToBounds = true

        accessoryType = .none

}


    func render(_ movie: Movie) {
        titleLabel.text = movie.title
        dateLabel.text  = movie.releaseDate
        noteLabel.text  = movie.note.description
        descriptionLabel.text = movie.description
        
        noteLabel.textColor = movie.note > 5 ? .black : .white
        noteLabel.backgroundColor = movie.note > 5 ? Colors.highRatingBackgroundColor : Colors.lowRatingBackgroundColor

    }
}
