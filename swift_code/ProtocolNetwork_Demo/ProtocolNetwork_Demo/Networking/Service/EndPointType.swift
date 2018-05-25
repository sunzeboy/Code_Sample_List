
//
//  File.swift
//  ProtocolNetwork_Demo
//
//  Created by sunze on 2018/5/25.
//  Copyright © 2018年 sz. All rights reserved.
//

import Foundation

protocol EndPointType {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: HTTPHeaders? { get }
}
