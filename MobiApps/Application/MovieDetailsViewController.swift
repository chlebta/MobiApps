//
//  MovieDetailsViewController.swift
//  MobiApps
//
//  Created by Ahmed K on 15/11/2017.
//  Copyright © 2017 MobiApps. All rights reserved.
//

import UIKit
import SimpleImageViewer

class MovieDetailsViewController: UIViewController {


    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var separatorLabel: UILabel!
    @IBOutlet weak var smallView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var backImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var noteLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!

    var movie: Movie!

    override func viewDidLoad() {
        super.viewDidLoad()

        customizeViews()
        updateFields()
        addGestureForImageViews()
    }

    func customizeViews() {

        view.backgroundColor = Colors.primaryBackgroundColor

        // Add share button
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareMovie( _ :)))
        // Add blur effect to small view
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = smallView.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        smallView.insertSubview(blurEffectView, at: 0)
        smallView.backgroundColor = .clear

        // set diffrent labels colors
        titleLabel.textColor = Colors.primary
        dateLabel.textColor = Colors.gray
        descriptionLabel.textColor = Colors.gray
        overviewLabel.textColor = Colors.primary
        separatorLabel.textColor = Colors.gray
    }

    func updateFields() {

        titleLabel.text = movie.title
        titleLabel.text = movie.title
        dateLabel.text  = movie.releaseDate
        noteLabel.text  = movie.note.description
        descriptionLabel.text = movie.description

        noteLabel.textColor = movie.note > 5 ? .black : .white
        noteLabel.backgroundColor = movie.note > 5 ? Colors.highRatingBackgroundColor : Colors.lowRatingBackgroundColor

        posterImageView.imageFromUrl(movie.posterUrl, .white)
        backImageView.imageFromUrl(movie.backdropUrl, .white)

    }

    func addGestureForImageViews() {

        posterImageView.isUserInteractionEnabled = true
        posterImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapOnImage(_:))))

        backImageView.isUserInteractionEnabled = true
        backImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapOnImage(_:))))
    }
}

//MARK:
extension MovieDetailsViewController {

    @objc func shareMovie( _ sender : Any) {

        let activityViewController = UIActivityViewController(
            activityItems: [movie.title, movie.getMovieUrl()],
            applicationActivities: nil)
        present(activityViewController, animated: true, completion: nil)
    }

    @objc func didTapOnImage( _ sender: UITapGestureRecognizer) {
        guard let imageview = sender.view as? UIImageView else {
            return
        }

        zoomImageView(imageview)
    }

    private func zoomImageView(_ imageView: UIImageView) {

        let configuration = ImageViewerConfiguration { config in
            config.imageView = imageView
        }

        present(ImageViewerController(configuration: configuration), animated: true)
    }

}
