//
//  HTTPMethod.swift
//  fmh
//
//  Created: 29.04.2022
//

import Foundation

struct HTTPMethod: Hashable {
    
    public static let get = HTTPMethod(rawValue: "GET")
    public static let post = HTTPMethod(rawValue: "POST")
    public static let put = HTTPMethod(rawValue: "PUT")
    public static let delete = HTTPMethod(rawValue: "DELETE")

    public let rawValue: String
    
}


