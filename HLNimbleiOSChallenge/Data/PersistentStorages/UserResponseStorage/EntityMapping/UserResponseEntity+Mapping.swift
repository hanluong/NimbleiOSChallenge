//
//  UserResponseEntity+Mapping.swift
//  HLNimbleiOSChallenge
//
//  Created by Han Luong on 23/10/2023.
//

import Foundation
import CoreData

extension UserResponseEntity {
    func toDTO() -> User {
        return .init(id: id ?? "", token: token ?? "")
    }
}

extension AuthenticationTokenRequestDTO {
    func toEntity(in context: NSManagedObjectContext) -> AuthenticationRequestEntity {
        let entity: AuthenticationRequestEntity = .init(context: context)
        entity.token = token
        return entity
    }
}
