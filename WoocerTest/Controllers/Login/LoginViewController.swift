//
//  LoginViewController.swift
//  WoocerTest
//
//  Created by Mohsen on 12/12/21.
//

import UIKit

class LoginViewController: MasterViewController {
    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var websiteAddressTextField: UITextField!
    @IBOutlet weak var consumerKey: UITextField!
    @IBOutlet weak var consumerSecret: UITextField!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func setupUI() {
        nameTextfield.setUnderLine()
        emailTextField.setUnderLine()
        websiteAddressTextField.setUnderLine()
        consumerKey.setUnderLine()
        consumerSecret.setUnderLine()
        backgroundView.layer.cornerRadius = 20
        loginButton.layer.cornerRadius = 20
        loginButton.tintColor = .white
    }
    @IBAction func loginButtonAction(_ sender: UIButton) {
        let url = URL(string: "https://wpt.woocer.com/wp-json/wc/v3/products?consumer_key=ck_85f212310cfff32728cc4c933331aa6bcf3002ef&consumer_secret=cs_ee784168289012a919a008985d2252fadecea2bb")
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.setValue(CloudApplicationKeys.appID.rawValue, forHTTPHeaderField: "X-Parse-Application-Id")
//        request.setValue(CloudApplicationKeys.restKey.rawValue, forHTTPHeaderField: "X-Parse-REST-API-Key")
//
//        request.setValue(sessionToken, forHTTPHeaderField: "X-Parse-Session-Token")
        
//        let jsonData = try? JSONEncoder().encode(parameters)
//        request.httpBody = jsonData
        
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
                            DispatchQueue.main.async {
                                let mainvc = Storyboard.Main.viewController(identifier: "MainViewController") as? MainViewController
                                let navController = UINavigationController(rootViewController: mainvc!)

                                navController.modalPresentationStyle = .fullScreen
                                mainvc!.productsData = result
                                self.present(navController, animated: true, completion: nil)
                            }
                            
                        } catch let error {
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
    
//        APIManager.postObject(url : "https://wpt.woocer.com/wp-json/wc/v3/products?consumer_key=ck_85f212310cfff32728cc4c933331aa6bcf3002ef&consumer_secret=cs_ee784168289012a919a008985d2252fadecea2bb")
//        let url = URL(string: "https://wpt.woocer.com/wp-json/wc/v3/products?consumer_key=ck_85f212310cfff32728cc4c933331aa6bcf3002ef&consumer_secret=cs_ee784168289012a919a008985d2252fadecea2bb")! //PUT Your URL
//                var request = URLRequest(url: url)
//                request.httpMethod = "GET"
//                let task = URLSession.shared.dataTask(with: request) { data, response, error in
//                    guard let safeData = data,
//                          let response = response as? HTTPURLResponse,
//                          error == nil else {                                              // check for fundamental networking error
//                              print("error", error ?? "Unknown error")
////                              delegate?.onError(error!)
//                              return
//                          }
//
//                    guard (200 ... 299) ~= response.statusCode else {                    // check for http errors
//                        print("statusCode should be 2xx, but is \(response.statusCode)")
//                        print("response = \(response)")
//                        return
//                    }
//
//                    if let responseString = String(data: safeData, encoding: .utf8){
//                        print("Response String = \(responseString)")
//
//                    }
//                }
//
//                task.resume()
    }
    
}

struct LoginDataModel : Codable{
    var name: String?
    var email: String?
    var websiteAddress: String?
    var consumerKey: String?
    var consumerSecret: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case email = "email"
        case websiteAddress = "websiteAddress"
        case consumerKey = "consumerKey"
        case consumerSecret = "consumerSecret"
    }
}
