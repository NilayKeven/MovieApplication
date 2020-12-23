//
//  ImageWithLabelComponent.swift
//  MovieApp
//
//  Created by Nilay Keven on 22.12.2020.
//

import UIKit

class ImageWithLabelComponent: DataBasedComponentView<ImageWithLabelData> {
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [indicatorImageView, descriptionLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 5
        stackView.axis = .horizontal
        return stackView
    }()
    
    private lazy var indicatorImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = .systemFont(ofSize: 15)
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
        descriptionLabel.text = data.text
        indicatorImageView.image = data.image
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainStackView.topAnchor.constraint(equalTo: topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            mainStackView.heightAnchor.constraint(equalToConstant: 30),
            indicatorImageView.widthAnchor.constraint(equalToConstant: 30),
            descriptionLabel.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
}
