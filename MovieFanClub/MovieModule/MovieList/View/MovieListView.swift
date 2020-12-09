//
//  ViewController.swift
//  MovieFanClub
//
//  Created by Sushobhit.Jain on 30/11/20.
//

import UIKit
import PKHUD

class MovieListView: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    var presenter: MovieListPresenterProtocol?
    var movieArray:[MovieModel] = []
    let cell_height:CGFloat = 200
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.viewDidLoad()
        self.configSubViews()
    }
    
    func configSubViews()
    {
        self.title = "Favorate List"
        self.tableView.register(UINib(nibName: MovieListTVCell.identifier, bundle: nil), forCellReuseIdentifier: MovieListTVCell.identifier)
        self.tableView.tableFooterView = UIView()
        
    }
    
    func reloadTableView()
    {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }


}

extension MovieListView : MovieListViewProtocol {
    
    func showMovies(with movies: [MovieModel]) {
        self.movieArray = movies
        self.reloadTableView()
    }
    
    func showError(_ error:String) {
        DispatchQueue.main.async {
            HUD.flash(.label("Internet not connected"), delay: 2.0)
        }
    }
    
    func showLoading() {
        DispatchQueue.main.async {
            HUD.show(.progress)
        }
    }
    
    func hideLoading() {
        DispatchQueue.main.async {
            HUD.hide()
        }
    }
    
    
}


extension MovieListView : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.movieArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieListTVCell.identifier, for: indexPath) as? MovieListTVCell
        if let createdCell = cell {
            createdCell.setupData(data: self.movieArray[indexPath.row])
            return createdCell
        }
        else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presenter?.showMovieDetail(forMovie: movieArray[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cell_height // static height
    }
}

