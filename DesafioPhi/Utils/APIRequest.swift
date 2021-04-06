//
//  APIRequest.swift
//  DesafioPhi
//
//  Created by Lucas Siqueira on 12/03/21.
//

import Foundation

class APIRequest {
    
    //MARK: - Instances
    
    private static let basePath = "https://desafio-mobile-bff.herokuapp.com/"
    
    private static let key = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c"
    
    private static let configurationSession: URLSessionConfiguration = {
        let config = URLSessionConfiguration.default
        config.allowsCellularAccess = false
        config.httpAdditionalHeaders = ["Content-Type": "application/json"]
        config.timeoutIntervalForRequest = 30.0
        config.httpMaximumConnectionsPerHost = 500
        return config
    }()
    
    private static let session = URLSession.init(configuration: configurationSession)
    
    //MARK: Function
    
    class func getContent<T: Codable> (endpoint: String, completionHandler: @escaping (_ result: Result<T, Error>) -> Void){
        
        guard let url = URL(string: "\(basePath)\(endpoint)") else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue(key, forHTTPHeaderField: "token")
        
        let dataTask = session.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            if let error = error {
                completionHandler(.failure(RequestError.networkError(error)))
                return
            }

            guard let httpResponse = response as? HTTPURLResponse, let data = data else {
                completionHandler(.failure(RequestError.notHTTPResponse))
                return
            }

            guard 200 ..< 300 ~= httpResponse.statusCode else {
                completionHandler(.failure(RequestError.invalidHTTPResponse(httpResponse.statusCode)))
                return
            }

            do {
                let content = try JSONDecoder().decode(T.self, from: data)
                completionHandler(.success(content))
            } catch let parseError {
                completionHandler(.failure(RequestError.parseError(parseError)))
            }
        }
        dataTask.resume()
    }
    
}

//MARK: Enum Request Error

private enum RequestError: Error {
    case networkError(Error)
    case notHTTPResponse
    case invalidHTTPResponse(Int)
    case parseError(Error)
}
