//
//  MovieModel.swift
//  MovieFanClub
//
//  Created by Sushobhit.Jain on 30/11/20.
//

import Foundation

struct MovieModel:Codable {
    var title:String?
    var year:String?
    var imdbID:String?
    var type:String?
    var poster:String?
    
    init(title:String,year:String,imdbID:String,type:String,poster:String) {
        self.title = title
        self.year = year
        self.imdbID = imdbID
        self.type = type
        self.poster = poster
    }
    
    private enum CodingKeys : String, CodingKey {
        case title = "Title", year = "Year", imdbID, type = "Type", poster = "Poster"
    }
    
}

struct MovieListResponse: Codable {
    var search:[MovieModel]?
    var response:String?
    var totalResults: String?
    
    private enum CodingKeys : String, CodingKey {
        case search = "Search", response = "Response",totalResults
    }
}
