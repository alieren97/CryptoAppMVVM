//
//  UIApplication.swift
//  CryptoApp
//
//  Created by Ali Eren on 7.02.2022.
//

import Foundation
import UIKit

extension UIApplication{
    
        func endEditing() {
            sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
    
}
