//
//  Response.swift
//  WoocerTest
//
//  Created by Mohsen on 12/14/21.
//

import Foundation

struct ProductsResponse: Codable {
  let data: [ProductsDataModel]
  let warnings: [Error]?
}
