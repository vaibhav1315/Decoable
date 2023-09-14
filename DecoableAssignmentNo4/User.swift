//
//  User.swift
//  DecoableAssignmentNo4
//
//  Created by Mac on 18/08/23.
//

import Foundation

struct APIResponse: Decodable {
    let page: Int
    let per_page: Int
    let total: Int
    let total_pages: Int
    let data: [User]
    let support: Support
}
struct User: Decodable {
    let id: Int
    let email: String
    let first_name: String
    let last_name: String
    let avatar: String
    
}
struct Support : Decodable {
    var url : String
    var text : String
}

