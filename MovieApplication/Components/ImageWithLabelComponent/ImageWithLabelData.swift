//
//  ImageWithLabelData.swift
//  MovieApp
//
//  Created by Nilay Keven on 22.12.2020.
//

import UIKit

public class ImageWithLabelData {
    
    private(set) var image: UIImage?
    private(set) var text: String?
    
    init(image: UIImage?, text: String?) {
        self.image = image
        self.text = text
    }
}
