//
//  TitleAndDescriptionWithPosterData.swift
//  MovieApp
//
//  Created by Hüdai Semih Çavdar on 22.12.2020.
//

import UIKit

public class TitleAndDescriptionWithPosterData {
    
    private(set) var title: String?
    private(set) var description: String?
    private(set) var posterUrl: URL?
    
    init(title: String?, description: String?, posterUrl: URL?) {
        self.title = title
        self.description = description
        self.posterUrl = posterUrl
    }
}
