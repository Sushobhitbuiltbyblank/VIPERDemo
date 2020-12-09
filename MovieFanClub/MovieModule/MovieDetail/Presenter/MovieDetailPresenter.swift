//
//  MovieDetailPresenter.swift
//  MovieFanClub
//
//  Created by Sushobhit.Jain on 30/11/20.
//

import Foundation

class MovieDetailPresenter: MovieDetailPresenterProtocol {
    
    weak var view: MovieDetailViewProtocol?
    var wireFrame: MovieDetailWireFrameProtocol?
    var Movie: MovieModel?
    
    func viewDidLoad() {
        view?.showMovieDetail(forMovie: Movie!)
    }
    
}
