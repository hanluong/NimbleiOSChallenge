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

extension UserRequestDTO {
    func toEntity(in context: NSManagedObjectContext) -> UserRequestEntity {
        let entity: UserRequestEntity = .init(context: context)
        entity.id = id
        entity.token = token
        return entity
    }
}
