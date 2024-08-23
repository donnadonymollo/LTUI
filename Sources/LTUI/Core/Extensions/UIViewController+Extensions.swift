//
//  UIViewController+Extensions.swift
//
//
//  Created by Mollo Quicaño Donnadony on 13/08/24.
//

import UIKit

extension UIViewController {
    
    func setupHideKeyboardOnTap(container: UIView) {
        let tap : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        container.addGestureRecognizer(tap)
    }
    
    /// Se sale de foco cuando se presione fuera
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}
