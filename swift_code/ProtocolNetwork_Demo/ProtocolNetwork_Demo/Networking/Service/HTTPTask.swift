//
//  HTTPTask.swift
//  ProtocolNetwork_Demo
//
//  Created by sunze on 2018/5/25.
//  Copyright © 2018年 sz. All rights reserved.
//

import Foundation

public typealias HTTPHeaders = [String:String]

enum HTTPTask {
    case request
    
    case requestParameters(bodyParameters: Parameters?,
        bodyEncoding: ParameterEncoding,
        urlParameters: Parameters?)
    
    case requestParametersAndHeaders(bodyParameters: Parameters?,
        bodyEncoding: ParameterEncoding,
        urlParameters: Parameters?,
        additionHeaders: HTTPHeaders?)
    
    // case download, upload...etc
}
