//
//  ResponseMapper.swift
//  NetworkLayerTemplate
//
//  Created by Dmitry Goncharenko on 8/18/16.
//  Copyright © 2016 DGon. All rights reserved.
//

import Foundation

protocol ResponseMapperProtocol {
    associatedtype Item
    static func process(obj: AnyObject?) throws -> Item
}

internal enum ResponseMapperError: ErrorType {
    case Invalid
    case MissingAttribute
}

class ResponseMapper<A: ParsedItem> {
    static func process(obj: AnyObject?, parse: (json: [String: AnyObject]) -> A?) throws -> A {
        guard let json = obj as? [String: AnyObject] else { throw ResponseMapperError.Invalid }
        if let item = parse(json: json) {
            return item
        } else {
            throw ResponseMapperError.MissingAttribute
        }
    }
}