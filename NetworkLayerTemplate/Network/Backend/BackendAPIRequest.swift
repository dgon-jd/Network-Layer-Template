//
//  BackendAPIRequest.swift
//  NetworkLayerTemplate
//
//  Created by Dmitry Goncharenko on 8/18/16.
//  Copyright © 2016 DGon. All rights reserved.
//

import Foundation

protocol BackendApiRequest {
    var endpoint : String { get }
    var method : NetworkService.Method { get }
    var parameters : [String : AnyObject]? { get }
    var headers : [String : String]?  { get }
}

extension BackendApiRequest {
    func defaultJSONHeaders() -> [String : String] {
        return ["Content-Type": "application/json"]
    }
}