//
//  SignUpOperation.swift
//  NetworkLayerTemplate
//
//  Created by Dmitry Goncharenko on 8/18/16.
//  Copyright © 2016 DGon. All rights reserved.
//

import Foundation

public class SignUpOperation: ServiceOperation {
    private let request: SignUpRequest
    
    public var success : (UserItem -> Void)?
    public var failure : (NSError -> Void)?
    
    public init(user: UserItem, password: String) {
        request = SignUpRequest(user: user, password: password)
        super.init()
    }
    
    private func handleSuccess(response: AnyObject?) {
        do {
            let item = try SignUpResponseMapper.process(response)
            self.success?(item)
            self.finish()
        } catch {
            self.handleFailure(NSError.cannotParseResponse())
        }
    }
    
    private func handleFailure(error: NSError) {
        self.failure?(error)
        self.finish()
    }
}