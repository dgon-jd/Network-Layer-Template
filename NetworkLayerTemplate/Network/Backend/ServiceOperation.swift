//
//  ServiceOperation.swift
//  NetworkLayerTemplate
//
//  Created by Dmitry Goncharenko on 8/18/16.
//  Copyright © 2016 DGon. All rights reserved.
//

import Foundation

public class ServiceOperation: NetworkOperation {
    let service: BackendService
    
    public override init() {
        self.service = BackendService(BackendConfiguration.shared)
        super.init()
    }
    
    public override func cancel() {
        service.cancel()
        super.cancel()
    }
}