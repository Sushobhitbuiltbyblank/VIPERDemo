//
//  MovieListInteractor.swift
//  MovieFanClub
//
//  Created by Sushobhit.Jain on 30/11/20.
//

import Foundation

class MovieListInteractor: MovieListInteractorInputProtocol {
    weak var presenter: MovieListInteractorOutputProtocol?
    
    var localDatamanager: MovieListLocalDataManagerInputProtocol?
    
    var remoteDatamanager: MovieListRemoteDataManagerInputProtocol?
    
    func retrieveMovieList(_ param:Dictionary<String,Any>) {
        do {
            if let MovieList = try localDatamanager?.retrieveMovieList() {
                let movieModelList = MovieList.map() {
                    return MovieModel(title: $0.title ?? "", year: $0.year ?? "", imdbID: $0.imdbID ?? "", type: $0.type ?? "", poster: $0.poster ?? "")
                }
                if movieModelList.isEmpty {
                    remoteDatamanager?.retrieveMovieList(param)
                }else{
                   presenter?.didRetrieveMovies(movieModelList)
                }
            } else {
                remoteDatamanager?.retrieveMovieList(param)
            }
            
        } catch {
            presenter?.didRetrieveMovies([])
        }

    }
    
    
}

extension MovieListInteractor : MovieListRemoteDataManagerOutputProtocol {
    
    func onMoviesRetrieved(_ Movies: [MovieModel]) {
        presenter?.didRetrieveMovies(Movies)
        DispatchQueue.main.async {
            for movieModel in Movies {
                do {
                    try self.localDatamanager?.saveMovie(imdbID: movieModel.imdbID ?? "", title: movieModel.title ?? "", poster: movieModel.poster ?? "" , type: movieModel.type ?? "", year: movieModel.year ?? "")
                } catch  {
                    print(error)
                }
            }
        }
    }
    
    func onError(_ error: String) {
        presenter?.onError(error)
    }
    
    
}
