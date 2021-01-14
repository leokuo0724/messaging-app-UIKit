//
//  Chat.swift
//  messaging-app-UIKit
//
//  Created by 郭家銘 on 2021/1/14.
//

import Foundation

enum OnlineStatus {
    case Online, Offline, Idle, None
}

struct Chat: Hashable {
    var userName: String
    var status: OnlineStatus
    var unReadCount: Int
    var lastMessage: MessageInfo
    
    var avatarImageName: String
    
    public init(
        userName: String,
        status: OnlineStatus,
        unReadCount: Int,
        lastMessage: MessageInfo,
        avatarImageName: String
        ) {
        self.userName = userName
        self.status = status
        self.unReadCount = unReadCount
        self.lastMessage = lastMessage
        self.avatarImageName = avatarImageName
    }
}

struct MessageInfo: Hashable {
    var content: String
    var timestamp: String
}

let chats: Array<Chat> = [
    Chat(userName: "Dalene Steward", status: .Idle, unReadCount: 5, lastMessage: MessageInfo(content: "Pls take a look at the images.", timestamp: "18.31"), avatarImageName: "avatar-0"),
    Chat(userName: "Fullsnack Designers", status: .None, unReadCount: 0, lastMessage: MessageInfo(content: "Hello guys, we have discussed about something else but I don't know.", timestamp: "16.04"), avatarImageName: "avatar-1"),
    Chat(userName: "Lee Williamson", status: .Online, unReadCount: 0, lastMessage: MessageInfo(content: "Yes, that’s gonna work, hopefully.", timestamp: "06.12"), avatarImageName: "avatar-2"),
    Chat(userName: "Ronald Mccoy", status: .Offline, unReadCount: 0, lastMessage: MessageInfo(content: "Thanks dude", timestamp: "Yesterday"), avatarImageName: "avatar-3"),
    Chat(userName: "Albert Bell", status: .Offline, unReadCount: 0, lastMessage: MessageInfo(content: "I‘m happy this anime has such great quality.", timestamp: "Yesterday"), avatarImageName: "avatar-4")
]
