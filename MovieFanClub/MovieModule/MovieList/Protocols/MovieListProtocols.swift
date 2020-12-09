//
//  MovieListProtocols.swift
//  MovieFanClub
//
//  Created by Sushobhit.Jain on 30/11/20.
//

import Foundation


import UIKit

protocol MovieListViewProtocol: class {
    var presenter: MovieListPresenterProtocol? { get set }
    
    // PRESENTER -> VIEW
    func showMovies(with Movies: [MovieModel])
    
    func showError(_ error:String)
    
    func showLoading()
    
    func hideLoading()
}

protocol MovieListWireFrameProtocol: class {
    static func createMovieListModule() -> UIViewController
    // PRESENTER -> WIREFRAME
    func presentMovieDetailScreen(from view: MovieListViewProtocol, forMovie Movie: MovieModel)
}

protocol MovieListPresenterProtocol: class {
    var view: MovieListViewProtocol? { get set }
    var interactor: MovieListInteractorInputProtocol? { get set }
    var wireFrame: MovieListWireFrameProtocol? { get set }
    
    // VIEW -> PRESENTER
    func viewDidLoad()
    func showMovieDetail(forMovie Movie: MovieModel)
}

protocol MovieListInteractorOutputProtocol: class {
    // INTERACTOR -> PRESENTER
    func didRetrieveMovies(_ movies: [MovieModel])
    func onError(_ error:String)
}

protocol MovieListInteractorInputProtocol: class {
    var presenter: MovieListInteractorOutputProtocol? { get set }
    var localDatamanager: MovieListLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: MovieListRemoteDataManagerInputProtocol? { get set }
    
    // PRESENTER -> INTERACTOR
    func retrieveMovieList(_ param:Dictionary<String,Any>)
}

protocol MovieListDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol MovieListRemoteDataManagerInputProtocol: class {
    var remoteRequestHandler: MovieListRemoteDataManagerOutputProtocol? { get set }
    
    // INTERACTOR -> REMOTEDATAMANAGER
    func retrieveMovieList(_ param:Dictionary<String,Any>)
}

protocol MovieListRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
    func onMoviesRetrieved(_ Movies: [MovieModel])
    func onError(_ error:String)
}

protocol MovieListLocalDataManagerInputProtocol: class {
     // INTERACTOR -> LOCALDATAMANAGER
    func retrieveMovieList() throws -> [Movie]
    func saveMovie(imdbID: String, title: String, poster: String, type: String, year:String) throws
}
