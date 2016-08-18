//
//  SignInItem.swift
//  NetworkLayerTemplate
//
//  Created by Dmitry Goncharenko on 8/18/16.
//  Copyright © 2016 DGon. All rights reserved.
//

import Foundation

public struct SignInItem: ParsedItem {
    public let token : String
    public let uniqueId: String
}