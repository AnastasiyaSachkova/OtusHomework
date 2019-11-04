//
//  ShareViewController.swift
//  ShareExtension
//
//  Created by 7Winds on 04.11.2019.
//  Copyright © 2019 Anastasiya Sachkova. All rights reserved.
//

import UIKit
import Social
import MobileCoreServices

let urlScheme = "OtusHomework1://text"
let group = "group.elis.ShareExtension"

class ShareViewController: SLComposeServiceViewController {

    override func isContentValid() -> Bool {
        // Do validation of contentText and/or NSExtensionContext attachments here
        return true
    }

  override func didSelectPost() {
           guard let text = textView.text else {return}

           if let ud = UserDefaults(suiteName: group) {
               ud.set(text, forKey: "text")
           }
           if let url = URL(string: urlScheme) {
               _ = openURL(url)
           }
           dismiss(animated: false) {
               self.extensionContext!.completeRequest(returningItems: [], completionHandler: nil)
           }
       }

       @objc func openURL(_ url: URL) -> Bool {
           var responder: UIResponder? = self
           while responder != nil {
               if let app = responder as? UIApplication {
                   return app.perform(#selector(openURL(_:)), with: url) != nil
               }
               responder = responder?.next
           }
           return false
       }
   }
    
