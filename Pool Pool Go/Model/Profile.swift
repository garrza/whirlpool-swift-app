//
//  Profile.swift
//  Pool Pool Go
//
//  Created by ramiro garza on 4/3/24.
//

import Foundation

struct Profile: Decodable, Equatable {
    var email: String
    var firstName: String
    var lastName: String
    var points: Int
    var reports: Int
    var rol_id: Int
    var uid: Int
    
    static let `default` = Profile(email: "default@example.com",
                                       firstName: "Nicolas",
                                       lastName: "Trevino",
                                       points: 220,
                                       reports: 5,
                                       rol_id: 1,
                                       uid: 1)

    init(email: String, firstName: String, lastName: String, points: Int, reports: Int, rol_id: Int, uid: Int) {
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        self.points = points
        self.reports = reports
        self.rol_id = rol_id
        self.uid = uid
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        email = try container.decode(String.self, forKey: .email)
        firstName = try container.decode(String.self, forKey: .firstName)
        lastName = try container.decode(String.self, forKey: .lastName)
        points = try container.decode(Int.self, forKey: .points)
        reports = try container.decode(Int.self, forKey: .reports)
        rol_id = try container.decode(Int.self, forKey: .rolId)
        uid = try container.decode(Int.self, forKey: .uid)
    }

    enum CodingKeys: String, CodingKey {
        case email, firstName, lastName, points, reports, rolId = "rol_id", uid
    }
}
