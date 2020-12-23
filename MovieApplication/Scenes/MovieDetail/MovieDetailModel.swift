//
//  MovieDetailModel.swift
//  MovieApp
//
//  Created by Nilay Keven on 23.12.2020.
//

import Foundation

struct Person: Codable {
    let adult: Bool?
    let gender: Int
    let name: String?
    let originalName: String?
    let profilePath: String?
    let id: Int?
    let character: String?
    
    enum CodingKeys: String, CodingKey {
        case adult
        case gender
        case name
        case originalName = "original_name"
        case profilePath = "profile_path"
        case id
        case character
    }
}

struct MovieCredits: Codable {
    let id: Int?
    let cast: [Person]?
    let crew: [Person]?
}
