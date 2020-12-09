//
//  MovieListPresenter.swift
//  MovieFanClub
//
//  Created by Sushobhit.Jain on 30/11/20.
//

import Foundation

class MovieListPresenter : MovieListPresenterProtocol{
    var view: MovieListViewProtocol?
    
    var interactor: MovieListInteractorInputProtocol?
    
    var wireFrame: MovieListWireFrameProtocol?
    
    func viewDidLoad() {
        view?.showLoading()
        // create initial parameter need to get data
        let param = ["apikey":apikey,"s":"cartoon","page":"1"]
        interactor?.retrieveMovieList(param)
    }
    
    func showMovieDetail(forMovie movie: MovieModel) {
        wireFrame?.presentMovieDetailScreen(from: view!, forMovie: movie)
    }
    
    
}

extension MovieListPresenter : MovieListInteractorOutputProtocol {
    func didRetrieveMovies(_ movies: [MovieModel]) {
        view?.hideLoading()
        view?.showMovies(with: movies)
    }
    
    func onError(_ error :String) {
        view?.hideLoading()
        view?.showError(error)
    }
    
}
