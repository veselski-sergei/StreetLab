//
//  Utils.swift
//  StreetLab
//
//  Created by Sergey Veselski on 01.05.2023.
//

import UIKit

class AppUtility {

    static func lockOrientation(_ orientation: UIInterfaceOrientationMask) {
    
        if let delegate = UIApplication.shared.delegate as? AppDelegate {
            delegate.orientationLock = orientation
        }
    }
    
}
