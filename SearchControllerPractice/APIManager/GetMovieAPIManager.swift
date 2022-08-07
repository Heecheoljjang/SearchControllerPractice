//
//  GetMovieAPIManager.swift
//  SearchControllerPractice
//
//  Created by HeecheolYoon on 2022/08/08.
//

import Foundation

import Alamofire
import SwiftyJSON

class GetMovieAPIManager {
    
    private init() {}
    
    static let shared = GetMovieAPIManager()
    
    func getMovieList(page: Int, completionHandler: @escaping ([String]) -> ()) {
        
        let url = EndPoint.getMovieURL + APIKey.TMDB_KEY + "&page=\(page)"
        AF.request(url, method: .get).validate().responseJSON(queue: .global()) { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                //print(json)

                let list = json["results"].arrayValue.map { $0["original_title"].stringValue }
                
                completionHandler(list)

            case .failure(let error):
                print(error)
            }
        }
    }
}
