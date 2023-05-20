//
//  NotificationRequest.swift
//  
//
//  Created by JeongTaek Han on 2023/05/20.
//

import Foundation
import UserNotifications


public protocol NotificationRequest {
    
    var id: String { get }
    var category: NotificationCategory? { get }
    var content: UNNotificationContent { get }
    var trigger: UNNotificationTrigger { get }
    var request: UNNotificationRequest { get }
    
}

public extension NotificationRequest {
    
    var request: UNNotificationRequest {
        UNNotificationRequest(
            identifier: id,
            content: content,
            trigger: trigger
        )
    }
    
}
