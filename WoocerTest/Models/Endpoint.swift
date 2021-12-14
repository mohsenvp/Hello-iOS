//
//  Endpoint.swift
//  WoocerTest
//
//  Created by Mohsen on 12/14/21.
//

import Foundation

protocol Endpoint {
  var path: String { get }
}

enum Coinbase {
  case bitcoin
}

extension Coinbase: Endpoint {
  var path: String {
    switch self {
    case .bitcoin: return "https://wpt.woocer.com/wp-json/wc/v3/products?consumer_key=ck_85f212310cfff32728cc4c933331aa6bcf3002ef&consumer_secret=cs_ee784168289012a919a008985d2252fadecea2bb"
    }
  }
}
