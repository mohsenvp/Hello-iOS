//
//  SwinjectStoryboard.swift
//  WoocerTest
//
//  Created by Mohsen on 12/14/21.
//

import Foundation
import Swinject
import SwinjectStoryboard
import SwinjectAutoregistration

extension SwinjectStoryboard {
  @objc class func setup() {
    defaultContainer.autoregister(Networking.self, initializer: HTTPNetworking.init)
    defaultContainer.autoregister(ProductsFetcher.self, initializer: WoocerProductFetcher.init)
    defaultContainer.storyboardInitCompleted(LoginViewController.self) { resolver, controller in
      controller.fetcher = resolver ~> ProductsFetcher.self
    }
  }
}
