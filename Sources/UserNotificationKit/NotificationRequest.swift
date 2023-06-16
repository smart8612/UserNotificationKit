//
//  NotificationRequest.swift
//  
//
//  Created by JeongTaek Han on 2023/05/20.
//

import Foundation
import UserNotifications

/// A type that contains the content and trigger of notification
///
/// NotificationRequest can be used to reserve a local notification
/// by requesting to the user notification center controller.
public protocol NotificationRequest {
    
    /// The unique identifier of the notification request.
    var id: String { get }
    
    /// The category of the notification request.
    var category: NotificationCategory? { get }
    
    /// The content of the notification request.
    var content: UNNotificationContent { get }
    
    /// The trigger of the notification request.
    var trigger: UNNotificationTrigger { get }
    
    /// The encapsulated reqeust of the notification request.
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
