//
//  TitleAndDescriptionWithPosterComponent.swift
//  MovieApp
//
//  Created by Nilay Keven on 21.12.2020.
//

import UIKit

class TitleAndDescriptionWithPosterComponent: DataBasedComponentView<TitleAndDescriptionWithPosterData> {
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [posterView, titleLabel, descriptionLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        stackView.axis = .vertical
        stackView.spacing = 3
        return stackView
    }()
    
    private lazy var posterView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = .boldSystemFont(ofSize: 25)
        label.isUserInteractionEnabled = false
        return label
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = .boldSystemFont(ofSize: 15)
        label.textColor = .gray
        label.isUserInteractionEnabled = false
        return label
    }()
    
    override func addMajorViews() {
        super.addMajorViews()
        addSubview(mainStackView)
        setupConstraints()
    }
    
    override func loadDataIntoViews() {
        super.loadDataIntoViews()
        guard let data = getData() else { return }
        titleLabel.text = data.title
        descriptionLabel.text = data.description
        posterView.sd_setImage(with: data.posterUrl, completed: nil)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            posterView.widthAnchor.constraint(equalToConstant: 300),
            posterView.heightAnchor.constraint(equalToConstant: 300),
            titleLabel.heightAnchor.constraint(equalToConstant: 50),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainStackView.topAnchor.constraint(equalTo: topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
