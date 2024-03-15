//
//  Model.swift
//  theProfile
//
//  Created by Fong on 3/15/24.
//

import Foundation
import Alamofire

class RandomUserModel{
    
    static var model = RandomUserModel()
    
    private init (){}
    private let apiURL = "https://randomuser.me/"
    
    func requestUser(completion:@escaping(_ data:Data?, _ error:Error?)->()){
        let url = apiURL + "api/"
        let parameter:Parameters? = nil
        AF.request(url,
                   method: .get,
                   parameters: parameter,
                   encoding: URLEncoding.default).response {res in
            switch res.result{
            case .success(_):
                return completion(res.data, nil)
            case .failure(let error):
                return completion(nil, error)
            }}
    }
    
    
}
