//
//  MovieDetailProtocol.swift
//  MovieFanClub
//
//  Created by Sushobhit.Jain on 30/11/20.
//

import Foundation
import UIKit

protocol MovieDetailViewProtocol: class {
    var presenter: MovieDetailPresenterProtocol? { get set }
    
    // PRESENTER -> VIEW
    func showMovieDetail(forMovie Movie: MovieModel)
}

protocol MovieDetailWireFrameProtocol: class {
    static func createMovieDetailModule(forMovie Movie: MovieModel) -> UIViewController
}

protocol MovieDetailPresenterProtocol: class {
    var view: MovieDetailViewProtocol? { get set }
    var wireFrame: MovieDetailWireFrameProtocol? { get set }
    var Movie: MovieModel? { get set }
    
    // VIEW -> PRESENTER
    func viewDidLoad()
}
