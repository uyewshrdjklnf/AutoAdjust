//
//  AutoAdjust.swift
//  AutoAdjust
//
//  Created by Jonathan Fritz on 05.09.18. 
//  Copyright © 2018 Jonathan Fritz Noscio IT-Servicedienstleistungen. All rights reserved.
//  

import Foundation
import UIKit

extension UITableView {
    // I am working on a way to deinit the observers when the tableview also is deiniting.
    // If you have ideas, feel free to help out!
    func setupAutoAdjust()
    {
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardshown), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardhide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    @objc func keyboardshown(_ notification:Notification)
    {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            self.fitContentInset(inset: UIEdgeInsetsMake(0, 0, keyboardSize.height, 0))
        }
    }
    @objc func keyboardhide(_ notification:Notification)
    {
        if ((notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue) != nil {
            self.fitContentInset(inset: .zero)
        }
        
    }
    func fitContentInset(inset:UIEdgeInsets!)
    {
        self.contentInset = inset
        self.scrollIndicatorInsets = inset
    }
}

