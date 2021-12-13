//
//  ProductsModel.swift
//  WoocerTest
//
//  Created by Mohsen on 12/12/21.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - WelcomeElement
struct ProductsDataModel: Codable {
    let id: Int
    let name, slug: String
    let permalink: String
    let dateCreated, dateCreatedGmt, dateModified, dateModifiedGmt: String
    let type, status: String
    let featured: Bool
    let catalogVisibility, welcomeDescription, shortDescription, sku: String
    let price, regularPrice, salePrice: String
    let dateOnSaleFrom, dateOnSaleFromGmt, dateOnSaleTo, dateOnSaleToGmt: JSONNull?
    let onSale, purchasable: Bool
    let totalSales: Int
    let virtual, downloadable: Bool
    let downloads: [JSONAny]
    let downloadLimit, downloadExpiry: Int
    let externalURL, buttonText, taxStatus, taxClass: String
    let manageStock: Bool
    let stockQuantity: Int?
    let backorders: String
    let backordersAllowed, backordered, soldIndividually: Bool
    let weight: String
    let dimensions: Dimensions
    let shippingRequired, shippingTaxable: Bool
    let shippingClass: String
    let shippingClassID: Int
    let reviewsAllowed: Bool
    let averageRating: String
    let ratingCount: Int
    let upsellIDS, crossSellIDS: [JSONAny]
    let parentID: Int
    let purchaseNote: String
    let categories: [Category]
    let tags: [JSONAny]
    let images: [Image]
    let attributes, defaultAttributes, variations, groupedProducts: [JSONAny]
    let menuOrder: Int
    let priceHTML: String
    let relatedIDS: [Int]
    let metaData: [MetaDatum]
    let stockStatus: String
    let jetpackRelatedPosts: [JetpackRelatedPost]
    let links: Links

    enum CodingKeys: String, CodingKey {
        case id, name, slug, permalink
        case dateCreated = "date_created"
        case dateCreatedGmt = "date_created_gmt"
        case dateModified = "date_modified"
        case dateModifiedGmt = "date_modified_gmt"
        case type, status, featured
        case catalogVisibility = "catalog_visibility"
        case welcomeDescription = "description"
        case shortDescription = "short_description"
        case sku, price
        case regularPrice = "regular_price"
        case salePrice = "sale_price"
        case dateOnSaleFrom = "date_on_sale_from"
        case dateOnSaleFromGmt = "date_on_sale_from_gmt"
        case dateOnSaleTo = "date_on_sale_to"
        case dateOnSaleToGmt = "date_on_sale_to_gmt"
        case onSale = "on_sale"
        case purchasable
        case totalSales = "total_sales"
        case virtual, downloadable, downloads
        case downloadLimit = "download_limit"
        case downloadExpiry = "download_expiry"
        case externalURL = "external_url"
        case buttonText = "button_text"
        case taxStatus = "tax_status"
        case taxClass = "tax_class"
        case manageStock = "manage_stock"
        case stockQuantity = "stock_quantity"
        case backorders
        case backordersAllowed = "backorders_allowed"
        case backordered
        case soldIndividually = "sold_individually"
        case weight, dimensions
        case shippingRequired = "shipping_required"
        case shippingTaxable = "shipping_taxable"
        case shippingClass = "shipping_class"
        case shippingClassID = "shipping_class_id"
        case reviewsAllowed = "reviews_allowed"
        case averageRating = "average_rating"
        case ratingCount = "rating_count"
        case upsellIDS = "upsell_ids"
        case crossSellIDS = "cross_sell_ids"
        case parentID = "parent_id"
        case purchaseNote = "purchase_note"
        case categories, tags, images, attributes
        case defaultAttributes = "default_attributes"
        case variations
        case groupedProducts = "grouped_products"
        case menuOrder = "menu_order"
        case priceHTML = "price_html"
        case relatedIDS = "related_ids"
        case metaData = "meta_data"
        case stockStatus = "stock_status"
        case jetpackRelatedPosts = "jetpack-related-posts"
        case links = "_links"
    }
}

// MARK: - Category
struct Category: Codable {
    let id: Int
    let name, slug: String
}

// MARK: - Dimensions
struct Dimensions: Codable {
    let length, width, height: String
}

// MARK: - Image
struct Image: Codable {
    let id: Int
    let dateCreated, dateCreatedGmt, dateModified, dateModifiedGmt: String
    let src: String
    let name, alt: String

    enum CodingKeys: String, CodingKey {
        case id
        case dateCreated = "date_created"
        case dateCreatedGmt = "date_created_gmt"
        case dateModified = "date_modified"
        case dateModifiedGmt = "date_modified_gmt"
        case src, name, alt
    }
}

// MARK: - JetpackRelatedPost
struct JetpackRelatedPost: Codable {
    let id: Int
    let url: String
    let urlMeta: URLMeta
    let title: String
    let date: DateEnum
    let format: Bool
    let excerpt, rel: String
    let context: Context
    let img: Img
    let classes: [JSONAny]

    enum CodingKeys: String, CodingKey {
        case id, url
        case urlMeta = "url_meta"
        case title, date, format, excerpt, rel, context, img, classes
    }
}

enum Context: String, Codable {
    case similarPost = "Similar post"
    case with1Comment = "With 1 comment"
    case with2Comments = "With 2 comments"
}

enum DateEnum: String, Codable {
    case february82020 = "February 8, 2020"
}

// MARK: - Img
struct Img: Codable {
    let altText: String
    let src: String
    let width, height: Int

    enum CodingKeys: String, CodingKey {
        case altText = "alt_text"
        case src, width, height
    }
}

// MARK: - URLMeta
struct URLMeta: Codable {
    let origin, position: Int
}

// MARK: - Links
struct Links: Codable {
    let linksSelf, collection: [Collection]

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case collection
    }
}

// MARK: - Collection
struct Collection: Codable {
    let href: String
}

// MARK: - MetaDatum
struct MetaDatum: Codable {
    let id: Int
    let key: Key
    let value: ValueUnion
}

enum Key: String, Codable {
    case elementorControlsUsage = "_elementor_controls_usage"
    case jetpackRelatedPostsCache = "_jetpack_related_posts_cache"
    case lastEditorUsedJetpack = "_last_editor_used_jetpack"
}

enum ValueUnion: Codable {
    case anythingArray([JSONAny])
    case string(String)
    case valueClass(ValueClass)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode([JSONAny].self) {
            self = .anythingArray(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        if let x = try? container.decode(ValueClass.self) {
            self = .valueClass(x)
            return
        }
        throw DecodingError.typeMismatch(ValueUnion.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for ValueUnion"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .anythingArray(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        case .valueClass(let x):
            try container.encode(x)
        }
    }
}

// MARK: - ValueClass
struct ValueClass: Codable {
    let the414C5E39686B80472Dfd19Eb68D5Cbda: The414C5E39686B80472Dfd19Eb68D5Cbda

    enum CodingKeys: String, CodingKey {
        case the414C5E39686B80472Dfd19Eb68D5Cbda = "414c5e39686b80472dfd19eb68d5cbda"
    }
}

// MARK: - The414C5E39686B80472Dfd19Eb68D5Cbda
struct The414C5E39686B80472Dfd19Eb68D5Cbda: Codable {
    let expires: Int
    let payload: [Payload]
}

// MARK: - Payload
struct Payload: Codable {
    let id: Int
}

typealias Welcome = [ProductsDataModel]

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
