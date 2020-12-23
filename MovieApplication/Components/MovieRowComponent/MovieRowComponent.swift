//
//  MovieRowComponent.swift
//  MovieApp
//
//  Created by Nilay Keven on 21.12.2020.
//

import UIKit
import SDWebImage

class MovieRowComponent: DataBasedComponentView<MovieRowData> {
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [movieImageView, labelsStackView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.axis = .horizontal
        stackView.backgroundColor = .blue
        stackView.layer.cornerRadius = 10
        return stackView
    }()
    
    private lazy var labelsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [movieTitleLabel, movieGenresLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .leading
        stackView.distribution = .equalCentering
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var movieTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .white
        label.isUserInteractionEnabled = false
        return label
    }()

    private lazy var movieGenresLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = .boldSystemFont(ofSize: 15)
        label.textColor = .white
        label.isUserInteractionEnabled = false
        return label
    }()
    
    private lazy var movieImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override func addMajorViews() {
        super.addMajorViews()
        addSubview(mainStackView)
        setupConstraints()
    }
    
    override func loadDataIntoViews() {
        super.loadDataIntoViews()
        guard let data = getData() else { return }
        movieTitleLabel.text = data.movieName
        movieGenresLabel.text = data.movieGenres
        movieImageView.sd_setImage(with: data.movieImageUrl, completed: nil)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            labelsStackView.heightAnchor.constraint(equalToConstant: 60),
            movieImageView.heightAnchor.constraint(equalToConstant: 100),
            movieImageView.widthAnchor.constraint(equalToConstant: 100),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            mainStackView.widthAnchor.constraint(equalTo: widthAnchor, constant: UIScreen.main.bounds.width - 20),
            mainStackView.heightAnchor.constraint(equalToConstant: 100),
        ])
    }
}
