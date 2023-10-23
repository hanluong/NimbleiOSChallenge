//
//  UserResponseStorage.swift
//  HLNimbleiOSChallenge
//
//  Created by Han Luong on 23/10/2023.
//

import Foundation

protocol UserResponseStorage {
    func getResponse(for request: UserRequestDTO, completion: @escaping (Result<UserResponseDTO?, CoreDataStorageError>) -> Void)
    func save(response: UserResponseDTO, for requestDto: UserRequestDTO)
}

