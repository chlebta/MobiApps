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

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor        = Colors.primaryBackgroundColor
        tableView.backgroundColor   = Colors.primaryBackgroundColor

        navigationController?.navigationBar.barStyle = .black

        tableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")

        APIManager.getMovies { result in

            switch result
            {
            case .success(let movies):
                print(movies.count)
                self.movies = movies
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
}

