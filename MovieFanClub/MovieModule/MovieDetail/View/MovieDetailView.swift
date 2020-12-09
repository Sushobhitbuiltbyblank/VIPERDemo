//
//  MovieDetailView.swift
//  MovieFanClub
//
//  Created by Sushobhit.Jain on 30/11/20.
//

import UIKit

class MovieDetailView: UIViewController {

    @IBOutlet weak var imageV: UIImageView!
    @IBOutlet weak var nameL: UILabel!
    @IBOutlet weak var yearL: UILabel!
    @IBOutlet weak var typeL: UILabel!
    var presenter: MovieDetailPresenterProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.viewDidLoad()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension MovieDetailView : MovieDetailViewProtocol {
   
    func showMovieDetail(forMovie movie: MovieModel) {
        self.nameL.text = movie.title
        self.yearL.text = movie.year
        self.typeL.text = movie.type
        let url = URL(string: movie.poster ?? "")!
        let placeholderImage = UIImage(named: "placeholder")!
        imageV?.af_setImage(withURL: url, placeholderImage: placeholderImage)
    }
    
    
}
