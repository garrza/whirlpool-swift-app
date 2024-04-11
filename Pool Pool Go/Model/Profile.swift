//
//  Profile.swift
//  Pool Pool Go
//
//  Created by ramiro garza on 4/3/24.
//

import Foundation

struct Profile: Decodable {
    var uid: Int
    var firstName: String
    var lastName: String
    var email: String
    var points: Int
    var reports: Int


    static let `default` = Profile(uid: 1, firstName: "Nicolás", lastName: "Treviño", email: "nicotrevino@whirpool.mx", points: 740, reports: 3)
}
