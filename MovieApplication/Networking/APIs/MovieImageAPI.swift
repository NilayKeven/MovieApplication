//
//  MovieImageAPI.swift
//  MovieApp
//
//  Created by Nilay Keven on 21.12.2020.
//

import Foundation

enum MovieImageAPI: EndpointType {
    
    case poster(posterPath: String)
    
    var baseURL: URL {
        var urlComponent = URLComponents()
        urlComponent.host = Constants.movieImageHost
        urlComponent.scheme = Constants.scheme
        urlComponent.path = path
        urlComponent.queryItems = [URLQueryItem(name: "api_key", value: Constants.apiKey)]
        guard let url = urlComponent.url else { return URL.init(string: "")!}
        return url
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var path: String {
        switch self {
        case .poster(posterPath: let posterPath):
            return "/t/p/w500/\(posterPath)"
        }
    }
    
    var queryItems: [URLQueryItem] {
        return [URLQueryItem(name: "api_key", value: Constants.apiKey)]
    }
    
    var httpHeaders: [HTTPHeader] {
        return []
    }
}
