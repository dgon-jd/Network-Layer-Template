//
//  SignInResponseMapper.swift
//  NetworkLayerTemplate
//
//  Created by Dmitry Goncharenko on 8/18/16.
//  Copyright © 2016 DGon. All rights reserved.
//

import Foundation

final class SignInResponseMapper: ResponseMapper<SignInItem>, ResponseMapperProtocol {
    static func process(obj: AnyObject?) throws -> SignInItem {
        return try process(obj, parse: { json in
            let token = json["token"] as? String
            let uniqueId = json["unique_id"] as? String
            if let token = token, let uniqueId = uniqueId {
                return SignInItem(token: token, uniqueId: uniqueId)
            }
            return nil
        })
    }
}