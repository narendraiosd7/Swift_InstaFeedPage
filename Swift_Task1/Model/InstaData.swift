//
//  InstaData.swift
//  Swift_Task1
//
//  Created by narendra.vadde on 28/05/21.
//

import Foundation

class InstaData: Codable {
    let stories: [String]?
    let users: [User]?

    init(stories: [String]?, users: [User]?) {
        self.stories = stories
        self.users = users
    }
}

class User: Codable {
    let profileName, profilePicture: String?
    let post: [String]?

    enum CodingKeys: String, CodingKey {
        case profileName = "profile_name"
        case profilePicture = "profile_picture"
        case post
    }

    init(profileName: String?, profilePicture: String?, post: [String]?) {
        self.profileName = profileName
        self.profilePicture = profilePicture
        self.post = post
    }
}
