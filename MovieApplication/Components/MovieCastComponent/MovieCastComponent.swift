//
//  MovieCastComponent.swift
//  MovieApp
//
//  Created by Nilay Keven on 23.12.2020.
//

import UIKit

class MovieCastComponent: UICollectionViewCell {
    
    lazy var profilePictureView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = imageView.frame.width / 2
        imageView.clipsToBounds = true
        imageView.backgroundColor = .clear
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        contentView.addSubview(profilePictureView)
        NSLayoutConstraint.activate([
            profilePictureView.leadingAnchor.constraint(equalTo: leadingAnchor),
            profilePictureView.trailingAnchor.constraint(equalTo: trailingAnchor),
            profilePictureView.topAnchor.constraint(equalTo: topAnchor),
            profilePictureView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
