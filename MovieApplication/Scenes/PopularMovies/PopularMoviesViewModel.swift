//
//  PopularMoviesViewModel.swift
//  MovieApp
//
//  Created by Nilay Keven on 21.12.2020.
//

import Foundation

class PopularMoviesViewModel {
    
    public var popularMovies = [Movie]()
    private var genres = [Genre]()
    public var popularMoviesData = [MovieRowData]()
    public var moviePagingNumber: Int = 1 {
        didSet {
            getPopularMovies()
        }
    }
    
    init() {
        getPopularMovies()
    }
    
    private func getPopularMovies() {
        MovieAPI.popularMovies(page: moviePagingNumber).retrieve(completion: { [weak self] (response: PopularMovies?) in
            guard let response = response, let popularMovies = response.results else { return }
            self?.popularMovies.append(contentsOf: popularMovies)
            self?.setPopularMoviesData()
        })
    }
    
    private func getGenres(onComplete: @escaping () -> ()) {
        MovieAPI.genres.retrieve(completion: { (response: Genres?) in
            guard let response = response, let genres = response.genres  else { return }
            self.genres = genres
            onComplete()
        })
    }
    
    private func setPopularMoviesData() {
        getGenres {
            for movie in self.popularMovies {
                let moviePosterPath = MovieImageAPI.poster(posterPath: movie.posterPath ?? "").baseURL
                let genre = self.findGenres(movie: movie)
                let data = MovieRowData(movieName: movie.title, movieGenres: genre, movieImageUrl: moviePosterPath)
                self.popularMoviesData.append(data)
            }
        }
    }
    
    private func findGenres(movie: Movie) ->  String {
        var modifiedGenres = ""
        var movieGenres = [String]()
        guard let genreIds = movie.genreIds else { return modifiedGenres }
        
        for id in genreIds {
            movieGenres.append(genres.first(where: { $0.id == id })?.name ?? "")
        }
        modifiedGenres = movieGenres.joined(separator: ", ")
        return modifiedGenres
    }
}
