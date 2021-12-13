//
//  APIManager.swift
//  WoocerTest
//
//  Created by Mohsen on 12/12/21.
//

import Foundation

class APIManager{
    func postObject<T: Encodable, U: Decodable>(url: String, model: U.Type, parameters: T, completionHandler: @escaping (Result<U, RequestError>) -> Void){
        let url = URL(string: "https://wpt.woocer.com/wp-json/wc/v3/products?consumer_key=ck_85f212310cfff32728cc4c933331aa6bcf3002ef&consumer_secret=cs_ee784168289012a919a008985d2252fadecea2bb")
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = 30.0
        sessionConfig.timeoutIntervalForResource = 30.0
        let session = URLSession(configuration: sessionConfig)
        
        let task = session.dataTask(with: request) { [self] data, response, error in
            
            if let httpResponse = response as? HTTPURLResponse {
                switch httpResponse.statusCode {
                case 200:
                    if let data = data{
                        do {
                            let dataString = String(data: data, encoding: .utf8)
                            let jsondata = dataString?.data(using: .utf8)
                            let result = try JSONDecoder().decode([ProductsDataModel].self, from: jsondata!)
                            print(result[0].id)
//                            completionHandler(.success(result as! U))
                            
                        } catch let error {
                            completionHandler(.failure(.badError))
                            print("Localized Error: \(error.localizedDescription)")
                            print("Error: \(error)")
                        }
//                        if let jsonResult = try? JSONDecoder().decode(WelcomeElement.self, from: data){
//                            print(jsonResult)
////                            completionHandler(.success(jsonResult))
//                        }else{
////                            completionHandler(.failure(.badJson))
//                        }
                    }
                    break
//                    completionHandler(false, nil, data)
                case 400:
                    break
                    
//                    completionHandler(true, "error" , nil)
                    
                    
                default:
                    break
//                    completionHandler(true, "error" , nil)
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
