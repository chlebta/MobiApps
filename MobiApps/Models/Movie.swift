//
//  Movie.swift
//  MobiApps
//
//  Created by Ahmed K on 15/11/2017.
//  Copyright © 2017 MobiApps. All rights reserved.
//

import Foundation

struct Movie: GenericModel {
    var id: Int
    var title: String
    var releaseDate: String
    var note: Float
    var description: String
    var posterUrl: String
    var backdropUrl: String
}

extension Movie {

    init?(_ object: Any?) {
        guard let json = object as?  [String: Any],
            let id = json["id"] as? Int,
            let title = json["title"] as? String,
            let releaseDate = json["release_date"] as? String,
            let note = json["vote_average"] as? Float,
            let description = json["overview"] as? String,
            let posterPath = json["poster_path"] as? String,
            let backdropPath = json["backdrop_path"] as? String else {
                return nil
        }
        self.title = title
        self.id = id
        self.releaseDate = releaseDate
        self.note = note
        self.description = description

        self.posterUrl =  "https://image.tmdb.org/t/p/w154" + posterPath
        self.backdropUrl = "https://image.tmdb.org/t/p/w780" + backdropPath
    }

    func getMovieUrl() -> String {
        return "https://www.themoviedb.org/movie/\(id)"
    }
}



