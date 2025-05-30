//
//  TeamMember.swift
//  TeamIntroApp
//
//  Created by ksy on 5/20/25.
//

import Foundation

struct TeamMember: Codable {
    let imageName: String
    let name: String
    let mbti: String
    let description: String
    let strengths: [String]
    let collaborationStyle: [String]
    let blogURL: URL
} 
