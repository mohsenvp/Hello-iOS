//
//  APIManager.swift
//  WoocerTest
//
//  Created by Mohsen on 12/12/21.
//

import Foundation

class APIManager{
    func postObject<T: Encodable>(url: String, parameters: T? = nil, completionHandler: @escaping (Bool, String? , Data?) -> Void){
        
        let url = URL(string: url)
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.setValue(CloudApplicationKeys.appID.rawValue, forHTTPHeaderField: "X-Parse-Application-Id")
//        request.setValue(CloudApplicationKeys.restKey.rawValue, forHTTPHeaderField: "X-Parse-REST-API-Key")
//
//        request.setValue(sessionToken, forHTTPHeaderField: "X-Parse-Session-Token")
        
        let jsonData = try? JSONEncoder().encode(parameters)
        request.httpBody = jsonData
        
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = 30.0
        sessionConfig.timeoutIntervalForResource = 30.0
        let session = URLSession(configuration: sessionConfig)
        
        let task = session.dataTask(with: request) { [self] data, response, error in
            
            if let httpResponse = response as? HTTPURLResponse {
                switch httpResponse.statusCode {
                case 200:
                    completionHandler(false, nil, data)
                case 400:
                    
                    completionHandler(true, "error" , nil)
                    
                    
                default:
                    completionHandler(true, "error" , nil)
                }
            }
            
//            if let httpError = error{
//                Singleton.shared.getCrashAnalyticsManager().reportWithDomain(domain: session.debugDescription, code: -1001, errorMessage: ["functionName": url!.lastPathComponent, "errorMessage": httpError.localizedDescription])
//                completionHandler(true, httpError.localizedDescription, nil)
//            }
        }
        task.resume()
    }
}

enum RequestError: String, Error {
    case serverError
    case badJson
    case badError
    case timeOut
    case cancellRequest
}
