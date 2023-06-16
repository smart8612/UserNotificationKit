//
//  NotificationCategory.swift
//  
//
//  Created by JeongTaek Han on 2023/05/20.
//

import Foundation
import UserNotifications

/// A type that declares an action which can be performed by notification request.
public protocol NotificationCategory {
    
    /// The unique identifier of the notification category.
    var id: String { get }
    
    /// The list of actions which can be performed by notification request.
    var actions: [UNNotificationAction] { get }
    
    /// The encapsulated category of the notification request.
    var category: UNNotificationCategory { get }
    
}

public extension NotificationCategory {
    
    var category: UNNotificationCategory {
        UNNotificationCategory(
            identifier: id,
            actions: actions,
            intentIdentifiers: []
        )
    }
    
}
