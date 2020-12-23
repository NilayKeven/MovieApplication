//
//  MovieCell.swift
//  MovieApp
//
//  Created by Nilay Keven on 21.12.2020.
//

import UIKit

class MovieCell: UITableViewCell {
    
    var movie: MovieRowData? {
        didSet {
            movieRow.setData(data: movie)
        }
    }
    
    private var movieRow: MovieRowComponent = {
        return MovieRowComponent()
    }()
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(movieRow)
        setupContraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupContraints() {
        NSLayoutConstraint.activate([
            movieRow.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            movieRow.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            movieRow.topAnchor.constraint(equalTo: contentView.topAnchor),
            movieRow.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
