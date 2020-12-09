//
//  MovieListLocalDataManager.swift
//  MovieFanClub
//
//  Created by Sushobhit.Jain on 30/11/20.
//

import Foundation
import CoreData

class MovieListLocalDataManager:MovieListLocalDataManagerInputProtocol {
    func saveMovie(imdbID: String, title: String, poster: String, type: String, year: String) throws {
        guard let managedOC = CoreDataStore.managedObjectContext else {
            throw PersistenceError.managedObjectContextNotFound
        }
        
        if let newMovie = NSEntityDescription.entity(forEntityName: "Movie",
                                                     in: managedOC) {
            let movie = Movie(entity: newMovie, insertInto: managedOC)
            movie.imdbID = imdbID
            movie.title = title
            movie.poster = poster
            movie.type = type
            movie.year = year
                try managedOC.save()
        }
//        throw PersistenceError.couldNotSaveObject
    }
    
    
    func retrieveMovieList() throws -> [Movie]  {
        
        guard let managedOC = CoreDataStore.managedObjectContext else {
            throw PersistenceError.managedObjectContextNotFound
        }
        
        let request: NSFetchRequest<Movie> = NSFetchRequest(entityName: String(describing: Movie.self))
        
        return try managedOC.fetch(request)
    }
    
    
}
