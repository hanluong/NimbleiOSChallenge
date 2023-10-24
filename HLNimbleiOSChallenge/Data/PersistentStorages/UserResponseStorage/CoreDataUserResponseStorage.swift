//
//  CoreDataUserResponseStorage.swift
//  HLNimbleiOSChallenge
//
//  Created by Han Luong on 23/10/2023.
//

import Foundation
import CoreData

final class CoreDataUserResponseStorage {

//    private let coreDataStorage: CoreDataStorage
//
//    init(coreDataStorage: CoreDataStorage = CoreDataStorage.shared) {
//        self.coreDataStorage = coreDataStorage
//    }
//
//    // MARK: - Private
//
//    private func fetchRequest(for requestDto: AuthenticationTokenRequestDTO) -> NSFetchRequest<UserRequestEntity> {
//        let request: NSFetchRequest = UserRequestEntity.fetchRequest()
//        request.predicate = NSPredicate(format: "%K = %@",
//                                        #keyPath(UserRequestEntity.token), requestDto.token)
//        return request
//    }
//
//    private func deleteResponse(for requestDto: AuthenticationTokenRequestDTO, in context: NSManagedObjectContext) {
//        let request = fetchRequest(for: requestDto)
//
//        do {
//            if let result = try context.fetch(request).first {
//                context.delete(result)
//            }
//        } catch {
//            print(error)
//        }
//    }
}

extension CoreDataUserResponseStorage: UserResponseStorage {

    func getResponse(for requestDto: AuthenticationTokenRequestDTO, completion: @escaping (Result<UserResponseDTO?, CoreDataStorageError>) -> Void) {
//        coreDataStorage.performBackgroundTask { context in
//            do {
//                let fetchRequest = self.fetchRequest(for: requestDto)
//                let requestEntity = try context.fetch(fetchRequest).first
//
//                completion(.success(requestEntity?.response?.toDTO()))
//            } catch {
//                completion(.failure(CoreDataStorageError.readError(error)))
//            }
//        }
    }

    func save(response responseDto: UserResponseDTO, for requestDto: AuthenticationTokenRequestDTO) {
//        coreDataStorage.performBackgroundTask { context in
//            do {
//                self.deleteResponse(for: requestDto, in: context)
//
//                let requestEntity = requestDto.toEntity(in: context)
//                requestEntity.response = responseDto.toEntity(in: context)
//
//                try context.save()
//            } catch {
//                // TODO: - Log to Crashlytics
//                debugPrint("CoreDataUserResponseStorage Unresolved error \(error), \((error as NSError).userInfo)")
//            }
//        }
    }
}

