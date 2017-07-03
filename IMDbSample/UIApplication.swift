//
//  UIApplication.swift
//  IMDbSample
//
//  Created by Reiko Goto on 2017/07/03.
//  Copyright © 2017年 Her. All rights reserved.
//

import Foundation
import UIKit
extension UIApplication {
    var statusBarView: UIView? {
        return value(forKey: "statusBar") as? UIView
    }
}
