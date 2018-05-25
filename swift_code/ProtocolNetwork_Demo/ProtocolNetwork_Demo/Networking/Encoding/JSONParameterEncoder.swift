//
//  JSONParameterEncoder.swift
//  ProtocolNetwork_Demo
//
//  Created by sunze on 2018/5/25.
//  Copyright © 2018年 sz. All rights reserved.
//

import Foundation

struct JSONParameterEncoder: ParameterEncoder {
    func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws {
        do {
            let jsonAsData = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            urlRequest.httpBody = jsonAsData
            if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
                urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            }
            
        } catch {
            throw NetworkError.encodingFailed
        }
    }
}
