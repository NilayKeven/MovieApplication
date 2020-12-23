//
//  MoviesAPI.swift
//  MovieApp
//
//  Created by Nilay Keven on 21.12.2020.
//

import Foundation

enum MovieAPI: EndpointType {
    
    case popularMovies(page: Int)
    case genres
    case getMovieDetail(movieID: Int)
    case getCredits(movieID: Int)
    case getActorDetail(castID: Int)
    
    var baseURL: URL {
        var urlComponent = URLComponents()
        urlComponent.host = Constants.baseHost
        urlComponent.scheme = Constants.scheme
        urlComponent.path = path
        urlComponent.queryItems = queryItems
        guard let url = urlComponent.url else { return URL.init(string: "")!}
        return url
    }
    
    var path: String {
        switch self {
        case .popularMovies:
            return "/3/movie/popular"
        case .genres:
            return "/3/genre/movie/list"
        case .getMovieDetail(let movieID):
            return "/3/movie/\(movieID)"
        case .getCredits(let movieID):
            return "/3/movie/\(movieID)/credits"
        case .getActorDetail(let castID):
            return "/3/person/\(castID)"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        default:
            return .get
        }
    }
    
    var queryItems: [URLQueryItem] {
        switch self {
        case .popularMovies(let page):
            return [URLQueryItem(name: "api_key", value: Constants.apiKey), URLQueryItem(name: "page", value: String(page))]
        default:
            return [URLQueryItem(name: "api_key", value: Constants.apiKey)]
        }
    }
    
    var httpHeaders: [HTTPHeader] {
        switch self {
        default:
            return []
        }
    }
}
