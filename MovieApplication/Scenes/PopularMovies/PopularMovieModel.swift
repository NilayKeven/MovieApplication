//
//  PopularMovieModel.swift
//  MovieApp
//
//  Created by Nilay Keven on 21.12.2020.
//

import Foundation

struct Movie: Codable {
    var id: Int
    let popularity: Double?
    let voteCount: Int?
    let video: Bool?
    let posterPath: String?
    let adult: Bool?
    let backDropPath: String?
    let originalLanguage: String?
    let title: String?
    let voteAverage: Double?
    let overview: String?
    let releaseDate: String?
    let genreIds: [Int]?
    let budget: Int?
    let homepage: String?
    let imdbId: String?
    let runtime: Int?
    let status: String?
    let tagline: String?
    let belongsToCollection: Collection?
    let originalTitle: String?
    let productionCompanies: [Company]?
    let productionCountries: [Country]?
    let revenue: Int?
    let spokenLanguages: [Language]?
    let genres: [Genre]?
    var modifiedGenres: String?
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case popularity
        case voteCount = "vote_count"
        case video
        case posterPath = "poster_path"
        case adult
        case backDropPath = "backdrop_path"
        case originalLanguage = "original_language"
        case title
        case voteAverage = "vote_average"
        case overview
        case releaseDate = "release_date"
        case genreIds = "genre_ids"
        case budget
        case homepage
        case imdbId = "imdb_id"
        case runtime
        case status
        case tagline
        case belongsToCollection = "belongs_to_collection"
        case originalTitle = "original_title"
        case productionCompanies = "production_companies"
        case productionCountries = "production_countries"
        case revenue
        case spokenLanguages = "spoken_languages"
        case modifiedGenres
        case genres
    }
}

struct PopularMovies: Codable {
    var page: Int?
    var results: [Movie]?
}

struct Genres: Codable {
    let genres: [Genre]?
}

struct Genre: Codable {
    let id: Int
    let name: String
}

struct Company: Codable {
    let id: Int?
    let logoPath: String?
    let name: String?
    let originCountry: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case logoPath = "logo_path"
        case name
        case originCountry = "origin_country"
    }
}

struct Country: Codable {
    let iso: String?
    let name: String?
    
    enum CodingKeys: String, CodingKey {
        case iso = "iso_3166_1"
        case name
    }
}

struct Language: Codable {
    let iso: String?
    let name: String?
    
    enum CodingKeys: String, CodingKey {
        case iso = "iso_ 639_1"
        case name
    }
}

struct Collection: Codable {
    let id: Int?
    let name: String?
    let posterPath: String?
    let backdropPath: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
    }
}
