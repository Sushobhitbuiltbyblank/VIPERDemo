//
//  Post+CoreDataProperties.swift
//  


import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie");
    }

    @NSManaged public var type: String?
    @NSManaged public var poster: String?
    @NSManaged public var title: String?
    @NSManaged public var imdbID: String?
    @NSManaged public var year:String?

}
