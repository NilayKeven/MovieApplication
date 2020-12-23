//
//  MovieDetailViewModel.swift
//  MovieApp
//
//  Created by Nilay Keven on 21.12.2020.
//

import Foundation

class MovieDetailViewModel {
    
    var movieId: Int
    var movieCredits: MovieCredits?
    
    init(movieId: Int) {
        self.movieId = movieId
        getMovieCredits(movieId: movieId) { [weak self] (movieCredits) in
            self?.movieCredits = movieCredits
        }
    }
    
    func getMovieDetail(movieId: Int, onComplete: @escaping (Movie) -> ()) {
        MovieAPI.getMovieDetail(movieID: movieId).retrieve(completion: { [weak self] (response: Movie?) in
            guard let movie = response else { return }
            onComplete(movie)
        })
    }
    
    func getMovieCredits(movieId: Int, onComplete: @escaping (MovieCredits) -> ()) {
        MovieAPI.getCredits(movieID: movieId).retrieve(completion: { [weak self] (response: MovieCredits?) in
            guard let movie = response else { return }
            onComplete(movie)
        })
    }
}

