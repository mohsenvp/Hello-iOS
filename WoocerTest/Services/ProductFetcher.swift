//
//  ProductFetcher.swift
//  WoocerTest
//
//  Created by Mohsen on 12/14/21.
//
import Foundation

protocol ProductsFetcher {
  func fetch(response: @escaping ([ProductsDataModel]?) -> Void)
}

struct WoocerProductFetcher: ProductsFetcher {
  let networking: Networking
  
  // 1. Initialize the fetcher with a networking object
  init(networking: Networking) {
    self.networking = networking
  }
  
  // 2. Fetch data, returning a PriceResponse object if successful
  func fetch(response: @escaping ([ProductsDataModel]?) -> Void) {
    networking.request(from: Coinbase.bitcoin) { data, error in
      // Log errors if we receive any, and abort.
      if let error = error {
        print("Error received requesting Bitcoin price: \(error.localizedDescription)")
        response(nil)
      }
      
        do {
            let dataString = String(data: data!, encoding: .utf8)
            let jsondata = dataString?.data(using: .utf8)
            let result = try JSONDecoder().decode([ProductsDataModel].self, from: jsondata!)
            print(result[0].id)
            response(result)

        } catch let error {
            print("Localized Error: \(error.localizedDescription)")
            print("Error: \(error)")
        }
      // Parse data into a model object.
//        let dataString = String(data: data!, encoding: .utf8)
//      let jsondata = dataString?.data(using: .utf8)
//      let decoded = self.decodeJSON(type: ProductsResponse.self, from: data)
//      if let decoded = decoded {
//          print("Price returned: \(decoded.data[0].id)")
//      }
    }
  }
  
  // 3. Decode JSON into an object of type 'T'
  private func decodeJSON<T: Decodable>(type: T.Type, from: Data?) -> T? {
    let decoder = JSONDecoder()
    guard let data = from,
      let response = try? decoder.decode(type.self, from: data) else { return nil }
    
    return response
  }
}
