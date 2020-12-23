//
//  MovieRowData.swift
//  MovieApp
//
//  Created byNilay Keven on 21.12.2020.
//

import Foundation
import UIKit

public class MovieRowData {
    
    private(set) var movieName: String?
    private(set) var movieGenres: String?
    private(set) var movieImageUrl: URL?
    
    public init(movieName: String?, movieGenres: String?, movieImageUrl: URL?) {
        self.movieName = movieName
        self.movieGenres = movieGenres
        self.movieImageUrl = movieImageUrl
    }
}
