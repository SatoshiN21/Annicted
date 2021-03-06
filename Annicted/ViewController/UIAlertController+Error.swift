//
//  UIAlertController+Error.swift
//  Annicted
//
//  Created by Satoshi Nagasaka on 2016/08/16.
//  Copyright © 2016年 SatoshiN21. All rights reserved.
//

import UIKit

let UnexpectedErrorTitle = "予期しないエラーが発生しました"

extension UIAlertController {
    
    convenience init(e: Error) {
        self.init(error:e as NSError)
    }
    
    convenience init(error: NSError) {
        self.init(errorTitle: error.localizedDescription,errorMessage: error.localizedFailureReason)
    }
    
    convenience init(errorTitle: String,errorMessage: String? = nil) {
        let title = errorTitle.isEmpty ? UnexpectedErrorTitle : errorTitle
        self.init(title: title, message: errorMessage, preferredStyle: .alert)
        addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    }
}
