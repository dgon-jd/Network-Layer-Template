//
//  NetworkService.swift
//  NetworkLayerTemplate
//
//  Created by Dmitry Goncharenko on 8/18/16.
//  Copyright © 2016 DGon. All rights reserved.
//

import Foundation

class NetworkService {
    
    private var task : NSURLSessionDataTask?
    private var successCodes: Range<Int> = 200..<299
    private var failureCodes: Range<Int> = 400..<499
    
    // TODO: add more methods
    enum Method: String {
        case GET, POST, PUT, DELETE
    }
    
    func request(url url: NSURL, method: Method,
                     parameters: [String : AnyObject]? = nil,
                     headers: [String : String]? = nil,
                     success: (NSData? -> Void)? = nil,
                     failure: ((data: NSData?, error: NSError?, responseCode: Int) -> Void)? = nil) {
        let mutableRequest = NSMutableURLRequest(URL: url, cachePolicy: .ReloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 10.0)
        mutableRequest.allHTTPHeaderFields = headers
        mutableRequest.HTTPMethod = method.rawValue
        if let params = parameters {
            mutableRequest.HTTPBody = try! NSJSONSerialization.dataWithJSONObject(params, options: [])
        }
        
        let session = NSURLSession.sharedSession()
        task = session.dataTaskWithRequest(mutableRequest, completionHandler: { data, response, error in
            guard let httpResponse = response as? NSHTTPURLResponse else {
                failure?(data: data, error: error, responseCode: 0)
                return
            }
            
            if let error = error {
                failure?(data: data, error: error, responseCode: httpResponse.statusCode)
            }
            
            if self.successCodes.contains(httpResponse.statusCode) {
                print("Request finished with SUCCESS")
                success?(data)
            } else if self.failureCodes.contains(httpResponse.statusCode) {
                print("Request finished with FAILURE: code \(httpResponse.statusCode)")
                failure?(data: data, error: error, responseCode: httpResponse.statusCode)
            } else {
                print("Request finished with serious FAILURE")
                
                let info = [
                    NSLocalizedDescriptionKey: "Request failed with code \(httpResponse.statusCode)",
                    NSLocalizedFailureReasonErrorKey: "Wrong handling logic, wrong endpoing mapping or backend bug."
                ]
                let error = NSError(domain: "NetworkService", code: 0, userInfo: info)
                failure?(data: data, error: error, responseCode: httpResponse.statusCode)
            }
        })
        
        task?.resume()
    }
    
    func cancel() {
        task?.cancel()
    }
}