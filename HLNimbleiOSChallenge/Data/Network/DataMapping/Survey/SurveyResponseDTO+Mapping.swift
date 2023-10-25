//
//  SurveyResponseDTO+Mapping.swift
//  HLNimbleiOSChallenge
//
//  Created by Han Luong on 25/10/2023.
//

import Foundation

// MARK: - Data Transfer Object

struct SurveyDataResponseDTO: Decodable {
    let data: [SurveyData]
}

extension SurveyDataResponseDTO {
    struct SurveyData: Decodable {
        let id: String
        let type: String
        let attributes: SurveyAttributes
    }
}

extension SurveyDataResponseDTO {
    struct SurveyAttributes: Decodable {
        let title: String
        let description: String
        let thankEmailAboveThreshold: String?
        let thankEmailBelowThreshold: String?
        let isActive: Bool
        let coverImageUrl: String
        let createdAt: String
        let activeAt: String
        let inActiveAt: String?
        let surveyType: String
        
        private enum CodingKeys: String, CodingKey {
            case title, description
            case thankEmailAboveThreshold = "thank_email_above_threshold"
            case thankEmailBelowThreshold = "thank_email_below_threshold"
            case isActive = "is_active"
            case coverImageUrl = "cover_image_url"
            case createdAt = "created_at"
            case activeAt = "active_at"
            case inActiveAt = "inactive_at"
            case surveyType = "survey_type"
        }
    }
}


// MARK: - Mappings to Domain

extension SurveyDataResponseDTO {
    func toDomain() -> SurveyList {
        return .init(surveys: data.map {$0.toDomain()})
    }
}

extension SurveyDataResponseDTO.SurveyData {
    func toDomain() -> Survey {
        return .init(id: id, title: attributes.title, description: attributes.description)
    }
}

