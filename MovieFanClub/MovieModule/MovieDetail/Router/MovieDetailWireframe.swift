//
//  MovieDetailWireframe.swift
//  MovieFanClub
//
//  Created by Sushobhit.Jain on 30/11/20.
//

import Foundation
import UIKit

class MovieDetailWireFrame: MovieDetailWireFrameProtocol {
    
    class func createMovieDetailModule(forMovie Movie: MovieModel) -> UIViewController {
        let viewController = movieListStoryboard.instantiateViewController(withIdentifier: "MovieDetailView")
        if let view = viewController as? MovieDetailView {
            let presenter: MovieDetailPresenterProtocol = MovieDetailPresenter()
            let wireFrame: MovieDetailWireFrameProtocol = MovieDetailWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.Movie = Movie
            presenter.wireFrame = wireFrame
            
            return viewController
        }
        return UIViewController()
    }
    
    static var movieListStoryboard: UIStoryboard {
        return UIStoryboard(name: "MovieList", bundle: Bundle.main)
    }
    
}
