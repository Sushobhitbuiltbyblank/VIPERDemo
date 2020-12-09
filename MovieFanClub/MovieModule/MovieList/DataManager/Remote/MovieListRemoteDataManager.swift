//
//  MovieListRemoteDataManager.swift
//  MovieFanClub
//
//  Created by Sushobhit.Jain on 30/11/20.
//

import Foundation


class MovieListRemoteDataManager : MovieListRemoteDataManagerInputProtocol{
    var remoteRequestHandler: MovieListRemoteDataManagerOutputProtocol?
    
    func retrieveMovieList(_ param:Dictionary<String,Any>) {      
        guard let url = ServiceManager.URLFromParameters(param, withPathExtension:"") else
        {
            return
        }
        let urlRequest = URLRequest(url: url)
        HttpClient.get(param: [:], urlRequest: urlRequest) { (response, status, error,statusCode) -> (Void) in
            if statusCode == 200 {
                if let responseData = response {
                    do {
                        let json = try JSONSerialization.jsonObject(with: responseData, options: .allowFragments)
                        print(json)
                    } catch let error {
                        print(error)
                    }
                    do{
                        let movieRes = try JSONDecoder().decode(MovieListResponse.self, from: responseData)
                        self.remoteRequestHandler?.onMoviesRetrieved(movieRes.search ?? [])
                    }
                    catch let error {
                        self.remoteRequestHandler?.onError(error.localizedDescription)
                        print(error)
                    }
                }
            }
            else {
                self.remoteRequestHandler?.onError("\(statusCode) issue")
            }
        }

    }
    
    
}
