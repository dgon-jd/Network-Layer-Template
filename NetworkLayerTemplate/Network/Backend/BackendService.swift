//
//  BackendService.swift
//  NetworkLayerTemplate
//
//  Created by Dmitry Goncharenko on 8/18/16.
//  Copyright © 2016 DGon. All rights reserved.
//

import Foundation

public let DidPerformUnauthorizedOperation = "DidPerformUnauthorizedOperation"

class BackendService {
    private let configuration: BackendConfiguration
    private let service = NetworkService()
    
    init(_ configuration: BackendConfiguration) {
        self.configuration = configuration
    }
    
    func request(request: BackendApiRequest,
                 success: (AnyObject? -> Void)? = nil,
                 failure: (NSError -> Void)? = nil) {
        let url = configuration.baseURL.URLByAppendingPathComponent(request.endpoint)
        
        var headers = request.headers
        headers?["X-Api-Auth-Token"] = BackendAuth.shared.token
        
        service.request(url: url, method: request.method, parameters: request.parameters, headers: headers, success: { data in
            var json : AnyObject? = nil
            if let data = data {
                json = try? NSJSONSerialization.JSONObjectWithData(data, options: [])
            }
            success?(json)
            }) { data, error, responseCode in
                if responseCode == 401 {
                    NSNotificationCenter.defaultCenter().postNotificationName(DidPerformUnauthorizedOperation, object: nil)
                    return
                }
                
                if let data = data {
                    let json = try? NSJSONSerialization.JSONObjectWithData(data, options: [])
                    let info = [
                        NSLocalizedDescriptionKey: json?["error"] as? String ?? "",
                        NSLocalizedFailureReasonErrorKey: "Probably not allowed action."
                    ]
                    let error = NSError(domain: "BackendService", code: 0, userInfo: info)
                    failure?(error)
                } else {
                    failure?(error ?? NSError(domain: "BackendService", code: 0, userInfo: nil))
                }
        }
    }
    
    func cancel() {
        service.cancel()
    }
}