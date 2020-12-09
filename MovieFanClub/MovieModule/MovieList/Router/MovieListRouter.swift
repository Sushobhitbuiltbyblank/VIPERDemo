//
//  MovieListRouter.swift
//  MovieFanClub
//
//  Created by Sushobhit.Jain on 30/11/20.
//

import Foundation
import UIKit

class MovieListWireFrame:MovieListWireFrameProtocol {
    static func createMovieListModule() -> UIViewController {
        
        let navController = MovieListStoryboard.instantiateViewController(withIdentifier: "MovieListNavigationVC")
        if let view = navController.children.first as? MovieListView {
            let presenter: MovieListPresenterProtocol & MovieListInteractorOutputProtocol = MovieListPresenter()
            let interactor: MovieListInteractorInputProtocol & MovieListRemoteDataManagerOutputProtocol = MovieListInteractor()
            let localDataManager: MovieListLocalDataManagerInputProtocol = MovieListLocalDataManager()
            let remoteDataManager: MovieListRemoteDataManagerInputProtocol = MovieListRemoteDataManager()
            let wireFrame: MovieListWireFrameProtocol = MovieListWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return navController
        }
        return UIViewController()
    }
    
    static var MovieListStoryboard: UIStoryboard {
        return UIStoryboard(name: "MovieList", bundle: Bundle.main)
    }
    
    func presentMovieDetailScreen(from view: MovieListViewProtocol, forMovie movie: MovieModel) {
        let MovieDetailViewController = MovieDetailWireFrame.createMovieDetailModule(forMovie: movie)
   
        if let sourceView = view as? UIViewController {
           sourceView.navigationController?.pushViewController(MovieDetailViewController, animated: true)
        }
    }
    
    
}
