//
//  SignInOperation.swift
//  NetworkLayerTemplate
//
//  Created by Dmitry Goncharenko on 8/18/16.
//  Copyright © 2016 DGon. All rights reserved.
//

import Foundation

public class SignInOperation: ServiceOperation {
    private let request: SignInRequest
    
    public var success : (SignInItem -> Void)?
    public var failure : (NSError -> Void)?
    
    public init(email: String, password: String) {
        request = SignInRequest(email: email, password: password)
        super.init()
    }
    
    private func handleSuccess(response: AnyObject?) {
        do {
            let item = try SignInResponseMapper.process(response)
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