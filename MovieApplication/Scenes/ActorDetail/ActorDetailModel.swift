//
//  ActorDetailModel.swift
//  MovieApp
//
//  Created by Nilay Keven on 23.12.2020.
//

import Foundation

struct Actor: Codable {
    let id: Int?
    let adult: Bool?
    let biography: String?
    let birthday: String?
    let name: String?
    let profilePath: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case adult
        case biography
        case birthday
        case name
        case profilePath = "profile_path"
    }
}
