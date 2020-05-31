//
//  Encodable+Extensions.swift
//  product_demo
//
//  Created by Kaan Biryol on 31.05.2020.
//  Copyright © 2020 Kaan Biryol. All rights reserved.
//

import Foundation

extension Encodable {

    func encode(to container: inout SingleValueEncodingContainer) throws {
        try container.encode(self)
    }

    var parameters: Parameters {
        do {
            let jsonEncoder: JSONEncoder = JSONEncoder()
            let jsonData: Data = try jsonEncoder.encode(AnyEncodable(self))
            if let json = try JSONSerialization.jsonObject(with: jsonData, options: []) as? Parameters {
                return json
            }
        } catch {
            return Parameters()
        }
        return Parameters()
    }

}

struct AnyEncodable: Encodable {

    var value: Encodable

    init(_ value: Encodable) {
        self.value = value
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try value.encode(to: &container)
    }

}
