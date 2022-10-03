//
//  EndPoint.swift
//  
//
//  Created by Abdeltawab Mohamed on 03/10/2022.
//

import Foundation

protocol APIEndPoint {
    var defaultURL: URL { get}
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var url : URL { get}
    var method: RequestMethod { get }
}

extension APIEndPoint {
    var defaultURL: URL {
       URL(string:"https://breakingbadapi.com/api")!
    }
    
    var scheme: String {
        "https"
    }

    var host: String {
        "breakingbadapi.com"
    }
    
    var url: URL {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path        
        return components.url ?? defaultURL
    }
    
    
    var method: RequestMethod {
        .get
    }

}

enum RequestMethod: String {
    case get = "GET"
}
