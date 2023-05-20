//
//  NotificationCategory.swift
//  
//
//  Created by JeongTaek Han on 2023/05/20.
//

import Foundation
import UserNotifications


public protocol NotificationCategory {
    
    var id: String { get }
    var actions: [UNNotificationAction] { get }
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
