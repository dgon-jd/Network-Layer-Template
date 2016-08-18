//
//  SignUpResponseMapper.swift
//  NetworkLayerTemplate
//
//  Created by Dmitry Goncharenko on 8/18/16.
//  Copyright © 2016 DGon. All rights reserved.
//

import Foundation

final class SignUpResponseMapper: ResponseMapper<UserItem>, ResponseMapperProtocol {
    static func process(obj: AnyObject?) throws -> UserItem {
        return try process(obj, parse: { json in
            let uniqueId = json["unique_id"] as? String
            let firstName = json["first_name"] as? String
            let lastName = json["last_name"] as? String
            let email = json["email"] as? String
            let phoneNumber = json["phone_number"] as? String
            
            if let uniqueId = uniqueId, let firstName = firstName,
                let lastName = lastName, let email = email {
                return UserItem(uniqueId: uniqueId, firstName: firstName,
                    lastName: lastName, email: email, phoneNumber: phoneNumber)
            }
            return nil
        })
    }
}