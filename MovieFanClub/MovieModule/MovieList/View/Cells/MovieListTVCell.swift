//
//  MovieListTVCell.swift
//  MovieFanClub
//
//  Created by Sushobhit.Jain on 30/11/20.
//

import UIKit
import AlamofireImage

class MovieListTVCell: UITableViewCell {
    
    @IBOutlet weak var titleL: UILabel!
    @IBOutlet weak var yearL: UILabel!
    @IBOutlet weak var typeL: UILabel!
    
    @IBOutlet weak var posterImgVC: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.customizeView()
        // Initialization code
    }
    
    static let identifier = String(describing: MovieListTVCell.self)
    
    func customizeView()
    {
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setupData(data:Any?) {
        self.selectionStyle = .none
        if let cellData = data as? MovieModel {
            self.titleL.text = cellData.title
            self.typeL.text = cellData.type
            self.yearL.text = cellData.year
            let url = URL(string: cellData.poster ?? "")!
            let placeholderImage = UIImage(named: "placeholder")!
            self.posterImgVC?.af_setImage(withURL: url, placeholderImage: placeholderImage)
        }
    }
    
}
