//
//  MovieDetailViewController.swift
//  MovieApp
//
//  Created by Nilay Keven on 21.12.2020.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    public var viewModel: MovieDetailViewModel?
    private var titleAndGenresWithPosterView: TitleAndDescriptionWithPosterComponent!
    private var movieDurationTimeView: ImageWithLabelComponent!
    private var releaseDateView: ImageWithLabelComponent!
    private var collectionCellIdentifier: String = "cast"
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: .zero)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var movieInformationStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleAndGenresWithPosterView, durationAndReleaseStackView, movieDescription, castLabel, castCollectionView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.spacing = 5
        return stackView
    }()
    
    private lazy var durationAndReleaseStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [movieDurationTimeView, releaseDateView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        stackView.distribution = .equalCentering
        stackView.axis = .horizontal
        return stackView
    }()
    
    private lazy var movieDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = .systemFont(ofSize: 15)
        label.isUserInteractionEnabled = false
        return label
    }()
    
    private lazy var castLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 18)
        label.text = "Cast"
        label.isUserInteractionEnabled = false
        return label
    }()

    private lazy var castCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        viewModel?.getMovieDetail(movieId: viewModel?.movieId ?? 0, onComplete: { [weak self] movie in
            DispatchQueue.main.async {
                self?.initiateViews(movie: movie)
            }
        })
    }
    
    private func initiateViews(movie: Movie) {
        setupTitleAndGenresView(movie: movie)
        setupMovieDurationView(durationTime: movie.runtime ?? 0)
        setupReleaseDateView(releaseDate: movie.releaseDate ?? "")
        setupCastCollectionView()
        movieDescription.text = movie.overview
        view.addSubview(scrollView)
        scrollView.addSubview(movieInformationStackView)
        setupConstraints()
    }
    
    private func setupTitleAndGenresView(movie: Movie) {
        titleAndGenresWithPosterView = TitleAndDescriptionWithPosterComponent()
        let moviePosterPath = MovieImageAPI.poster(posterPath: movie.posterPath ?? "").baseURL
        let data = TitleAndDescriptionWithPosterData(title: movie.title ?? "", description: "", posterUrl: moviePosterPath)
        titleAndGenresWithPosterView.setData(data: data)
    }
    
    private func setupMovieDurationView(durationTime: Int) {
        movieDurationTimeView = ImageWithLabelComponent()
        let time = String(durationTime) + " min"
        let data = ImageWithLabelData(image: UIImage(named: "time"), text: time)
        movieDurationTimeView.setData(data: data)
    }
    
    private func setupReleaseDateView(releaseDate: String) {
        releaseDateView = ImageWithLabelComponent()
        let data = ImageWithLabelData(image: UIImage(named: "calendar"), text: releaseDate)
        releaseDateView.setData(data: data)
    }
    
    private func setupCastCollectionView() {
        castCollectionView.delegate = self
        castCollectionView.dataSource = self
        castCollectionView.backgroundColor = .white
        castCollectionView.register(MovieCastComponent.self, forCellWithReuseIdentifier: collectionCellIdentifier)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            movieDescription.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 20),
            movieInformationStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10),
            movieInformationStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10),
            movieInformationStackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20),
            movieInformationStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -20),
            castCollectionView.heightAnchor.constraint(equalTo: castCollectionView.widthAnchor, multiplier: 0.5),
            castCollectionView.leadingAnchor.constraint(equalTo: movieInformationStackView.leadingAnchor),
            castCollectionView.trailingAnchor.constraint(equalTo: movieInformationStackView.trailingAnchor)
        ])
    }
}
extension MovieDetailViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.movieCredits?.cast?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = castCollectionView.dequeueReusableCell(withReuseIdentifier: collectionCellIdentifier,
                                                          for: indexPath) as? MovieCastComponent
        let person = viewModel?.movieCredits?.cast?[indexPath.row]
        let profilePictureUrl = MovieImageAPI.poster(posterPath: person?.profilePath ?? "").baseURL
        cell?.profilePictureView.sd_setImage(with: profilePictureUrl, completed: nil)
        if cell?.profilePictureView.image == nil {
            cell?.profilePictureView.image = UIImage(named: "profilePlaceholder")
        }
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: castCollectionView.frame.width / 2.5, height: castCollectionView.frame.width)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let actor = viewModel?.movieCredits?.cast?[indexPath.row]
        let actorDetailViewModel = ActorDetailViewModel(castId: actor?.id ?? 0)
        let actorDetailViewController = ActorDetailViewController()
        actorDetailViewController.viewModel = actorDetailViewModel
        self.navigationController?.pushViewController(actorDetailViewController, animated: true)
    }
    
}
