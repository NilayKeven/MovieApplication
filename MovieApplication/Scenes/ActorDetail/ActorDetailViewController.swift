//
//  ActorDetailViewController.swift
//  MovieApp
//
//  Created by Nilay Keven on 23.12.2020.
//

import UIKit

class ActorDetailViewController: UIViewController {
    
    public var viewModel: ActorDetailViewModel?
    private var biographyView: TitleAndDescriptionWithPosterComponent!
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [biographyView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.axis = .vertical
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initiateViews()
    }
    
    private func initiateViews() {
        viewModel?.getActorDetail(castId: viewModel?.castId ?? 0, onComplete: { [weak self] (actor) in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.setupBiographyView(actor: actor)
                self.view.addSubview(self.mainStackView)
                self.setupConstraints()
            }
        })
    }
    
    private func setupBiographyView(actor: Actor) {
        biographyView = TitleAndDescriptionWithPosterComponent()
        let profilePictureUrl = MovieImageAPI.poster(posterPath: actor.profilePath).baseURL
        let data = TitleAndDescriptionWithPosterData(title: actor.name ?? "", description: actor.biography, posterUrl: profilePictureUrl)
        biographyView.setData(data: data)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            mainStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            mainStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
