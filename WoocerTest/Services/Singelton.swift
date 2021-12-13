//
//  Singelton.swift
//  WoocerTest
//
//  Created by Mohsen on 12/12/21.
//

import Foundation
struct Singleton  {
    static var shared = Singleton()
    
    private var apiManager: APIManager?
    
//    private var localDataManager: LocalDataManager?
    
    private init() {
        //reinit data manager
    }
    
    mutating func getApiManager() -> APIManager{
        if apiManager == nil{
            self.apiManager = APIManager()
            return self.apiManager!
        }else{
            return apiManager!
        }
    }
    
  
}
