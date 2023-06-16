//
//  UserNotificationCenterController.swift
//  
//
//  Created by JeongTaek Han on 2023/05/20.
//

import Foundation
import UserNotifications

/// The central object that managing notification-related activities for your app.
public final class UserNotificationCenterController {
    
    /// A shared instance of the user notification center controller object.
    public static let shared = UserNotificationCenterController()
    
    /// Create a user notification center controller object.
    ///
    /// Because ``UserNotificationCenterController`` is designed for using singleton,
    /// so you must have to use ``shared`` property if you need to use this type.
    private init() {}
    
    /// A property that refers UNUserNotificationCenter's singleton instance.
    private let center = UNUserNotificationCenter.current()
    
    /// A computed property that represent the means of notification that the app can use.
    private var usedAuthorizationOptions: UNAuthorizationOptions {
        [.alert, .badge, .sound]
    }
    
    /// Configures your app to handle notifications.
    ///
    /// If you want to make your app handle the notifications, You must have to following instroduction.
    /// First, Make your AppDelegate object conform UNUserNotificationCenterDelegate.
    /// Second, Call the configure method on ``UserNotificationCenterController``
    /// with AppDelegate object.
    ///
    /// - Parameter object: An object which conforms UNUserNotificationCenterDelegate protocol.
    public func configure(with object: UNUserNotificationCenterDelegate) {
        center.delegate = object
        authorizeIfNeeded()
    }
    
    /// Send notification request to user notification center for reserving a local notification posting.
    /// - Parameters:
    ///   - request: The notification request which you want to reserve.
    ///   - completionHandler: An action closure that will be called when the sending task is completed.
    public func send<Request: NotificationRequest>(request: Request, completionHandler: ((Error?) -> Void)? = nil) {
        authorizeIfNeeded { [weak self] granted in
            guard granted else {
                DispatchQueue.main.async {
                    completionHandler?(NotificationRequestError.unauthorizedNotification)
                }
                return
            }
            self?.center.add(request.request, withCompletionHandler: completionHandler)
        }
    }
    
    /// Set the notification categories which will be used on your app.
    ///
    /// You must have to set the notification category,
    /// if you want to define or process notification's action event.
    ///
    /// - Parameter categories: The list of the notification categories.
    public func setCategories<Category: NotificationCategory>(_ categories: [Category]) {
        let categories = categories.map { $0.category }
        center.setNotificationCategories(Set(categories))
    }
    
    /// Verify authorization status which will be used to check whether notification's can be posted.
    /// - Parameter completion: An action closure that will be called when the authorizing task is completed.
    private func authorizeIfNeeded(completion: ((Bool) -> ())? = nil) {
        center.getNotificationSettings { settings in
            switch settings.authorizationStatus {
            case .authorized:
                completion?(true)
            case .notDetermined:
                self.center.requestAuthorization(options: self.usedAuthorizationOptions) { granted, _ in
                    completion?(granted)
                }
            case .denied, .provisional, .ephemeral:
                completion?(false)
            default:
                completion?(false)
            }
        }
    }
    
    /// A type that refers error that can be occured.
    enum NotificationRequestError: Error {
        case unauthorizedNotification
    }
    
}
