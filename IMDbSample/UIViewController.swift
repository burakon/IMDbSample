//
//  UIViewController.swift
//  IMDbSample
//
//  Created by Reiko Goto on 2017/07/05.
//  Copyright © 2017年 Her. All rights reserved.
//

import Foundation
import UIKit
extension UIViewController {
    /// ナビゲーションバーの透過処理
    ///
    /// - Parameter position: <#position description#>
    func setNavigationBarFromPosition(position: CGFloat ,height: CGFloat) {
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        let showHeight = height * 2
        let alpha = Double(position / showHeight)
        //set alpha
        let tabColor = (UIColor.white).withAlphaComponent(CGFloat(alpha))
        self.navigationController?.navigationBar.backgroundColor = tabColor
        UIApplication.shared.statusBarView?.backgroundColor = tabColor
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : (UIColor.white).withAlphaComponent(CGFloat(alpha - 1))]
        if alpha < 1 {
            self.navigationController?.navigationBar.shadowImage = UIImage()
        } else {
            self.navigationController?.navigationBar.shadowImage = nil
        }
    }
}
