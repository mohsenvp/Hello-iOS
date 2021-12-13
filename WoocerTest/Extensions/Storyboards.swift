//
//  Storyboards.swift
//  WoocerTest
//
//  Created by Mohsen on 12/13/21.
//

import UIKit
extension UIViewController{
    

    class var storyboardID : String{
        return"\(self)"
    }
    
    static func instantiate(fromAppStoryboard appStoryboard : Storyboard) -> Self {
        return appStoryboard.viewController(name: self)
    }
}

enum Storyboard : String {
    
    case Main, Login
    
    var instance : UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
    
    func viewController<T : UIViewController>(name : T.Type) -> T {
        
        let storyboardID = (name as UIViewController.Type).storyboardID
        return instance.instantiateViewController(withIdentifier: storyboardID) as! T
    }
    
    func viewController<T : UIViewController>(identifier : String) -> T {
        return instance.instantiateViewController(withIdentifier: identifier) as! T
    }
    
    func initialViewController() -> UIViewController? {
        return instance.instantiateInitialViewController()
    }
}
