//
//  NotificationCentre.swift
//  Khalo
//
//  Created by Aleem Razzaq on 06/12/2022.
//

import Foundation
import UserNotifications
class NotificationCenter: NSObject, ObservableObject {
    var dumbData: UNNotificationResponse?
    override init() {
       super.init()
       UNUserNotificationCenter.current().delegate = self
    }
}
extension NotificationCenter: UNUserNotificationCenterDelegate  {
func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
   completionHandler([.alert, .sound, .badge])
}
func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
   dumbData = response
   completionHandler()
}
  func userNotificationCenter(_ center: UNUserNotificationCenter, openSettingsFor notification: UNNotification?) { }
}
