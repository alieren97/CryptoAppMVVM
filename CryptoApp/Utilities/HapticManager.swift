//
//  HapticManager.swift
//  CryptoApp
//
//  Created by Ali Eren on 10.02.2022.
//

import Foundation
import UIKit

class HapticManager {
    static private let generator = UINotificationFeedbackGenerator()
    
    static func notification(type:UINotificationFeedbackGenerator.FeedbackType){
        generator.notificationOccurred(type)
    }
}
