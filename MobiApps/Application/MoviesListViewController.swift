//
//  MoviesListViewController.swift
//  MobiApps
//
//  Created by Ahmed K on 14/11/2017.
//  Copyright © 2017 MobiApps. All rights reserved.
//

import UIKit

class MoviesListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var movies: [Movie] = []

    var currentPage = 1
    var isloadingData = false

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Discover"
        navigationController?.navigationBar.barStyle = .black
        view.backgroundColor = Colors.primaryBackgroundColor
        navigationController?.navigationBar.tintColor = .white

        //TableView
        tableView.backgroundColor   = Colors.primaryBackgroundColor
        tableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")

        getData()
    }


}
// MARK:
// MARK: Tableview
extension MoviesListViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath) as! MovieTableViewCell
        cell.render(movies[indexPath.row])
        return cell
        
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let movieDetailsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "movieDetailsVC") as? MovieDetailsViewController else {
            return
        }

        movieDetailsVC.movie = movies[indexPath.row]
        navigationController?.pushViewController(movieDetailsVC, animated: true)
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {

        // Load More
        if !isloadingData && indexPath.row >= movies.count - 5 {
            getData()
        }

    }
}

//MARK:
extension MoviesListViewController {

    func getData() {

        guard isloadingData == false else {
            return
        }
        
        isloadingData = true

        APIManager.getMovies(currentPage) { result in

            switch result
            {
            case .success(let movies):
                self.movies.append(contentsOf: movies)
                self.tableView.reloadData()
                self.currentPage += 1

            case .failure(let error):
                print(error)
            }

            self.isloadingData = false
        }
    }
}

