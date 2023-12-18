//
//  TrackedStudyModel.swift
//  AST_Main
//
//  Created by Sam Valasek on 03/12/2023.
//

import Foundation

struct TrackedStudy: Identifiable, Codable {
    let id: String
    let ownerUid: String
    let subject: String
    let Description: String
    var note: String
    let timestamp: Date
    var user: User?
    
}

extension TrackedStudy {
    static var MOCK_STUDY: [TrackedStudy] = [
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, subject: "Computer Science", Description: "Topic 2 Revision", note: "Completed Topic 2 Revision", timestamp: Date(), user: User.MOCK_USERS[0]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, subject: "Physics", Description: "Topic 28 Homework", note: "Completed Topic 2 Revision", timestamp: Date(), user: User.MOCK_USERS[0]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, subject: "Maths", Description: "Section 2 Test", note: "Completed Topic 2 Revision", timestamp: Date(), user: User.MOCK_USERS[0])
        ]
}
