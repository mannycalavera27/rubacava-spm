//
//  UIViewController+MailExt.swift
//  
//
//  Created by Tiziano Cialfi on 25/02/21.
//

import UIKit
import MessageUI

public extension UIViewController {
    
    func sendEmail(to: String..., subject: String? = nil, body: String? = nil) {
        guard MFMailComposeViewController.canSendMail() else { return }
        let mailController = MFMailComposeViewController()
        mailController.mailComposeDelegate = self as? MFMailComposeViewControllerDelegate
        mailController.setToRecipients(to)
        if let subject = subject {
            mailController.setSubject(subject)
        }
        if let body = body {
            mailController.setMessageBody(body, isHTML: false)
        }
        present(mailController, animated: true, completion: nil)
        
    }
    
}
