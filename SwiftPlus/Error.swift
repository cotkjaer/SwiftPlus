//
//  NSError.swift
//  UserInterface
//
//  Created by Christian Otkjær on 18/02/16.
//  Copyright © 2016 Christian Otkjær. All rights reserved.
//

import Foundation

extension NSError
{
    public convenience init(
        domain: String,
        code: Int,
        description: String? = nil,
        reason: String? = nil,
        underlyingError: NSError? = nil)
    {
        var errorUserInfo: [String : AnyObject] = [:]
        
        if description != nil
        {
            errorUserInfo[NSLocalizedDescriptionKey] = description as AnyObject?? ?? "" as AnyObject?
        }
        if reason != nil
        {
            errorUserInfo[NSLocalizedFailureReasonErrorKey] = reason as AnyObject?? ?? "" as AnyObject?
        }
        
        if underlyingError != nil
        {
            errorUserInfo[NSUnderlyingErrorKey] = underlyingError
        }
        
        self.init(domain: domain, code: code, userInfo: errorUserInfo)
    }
}


extension Error
{
    public func presentAsAlert(_ handler:((UIAlertAction) -> ())? = nil)
    {
        UIApplication.topViewController()?.presentErrorAsAlert(self, animated: true, handler: handler)
    }
}

// MARK: - Error

public extension UIViewController
{
    func presentErrorAsAlert<E:Error>(_ error: E?, animated: Bool = true, handler: ((UIAlertAction) -> ())? = nil)
    {
        guard let error = error else { return }
        
        let alertController = UIAlertController(title: UIKitLocalizedString("Error"), message: String(describing: error), preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: UIKitLocalizedString("Done"), style: .default, handler: handler))
        
        DispatchQueue.main.async(execute: {
            self.present(alertController, animated: animated) { debugPrint("Showing error: \(self)") } } )
    }

    func presentErrorAsAlert(_ error: NSError?, animated: Bool = true, handler: ((UIAlertAction) -> ())? = nil)
    {
        guard let error = error else { return }
        
        let alertController = UIAlertController(title: error.localizedDescription, message: error.localizedFailureReason, preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: UIKitLocalizedString("Done"), style: .default, handler: handler))
        
        //TODO: localizedRecoveryOptions
        
        DispatchQueue.main.async(execute: {
            self.present(alertController, animated: animated) { debugPrint("Showing error: \(self)") } } )
    }

}
