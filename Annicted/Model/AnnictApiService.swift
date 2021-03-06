//
//  AnnictApiService.swift
//  Annicted
//
//  Created by 長坂悟志 on 2016/07/21.
//  Copyright © 2016年 SatoshiN21. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Keys

class AnnictApiService {
    
    
    enum ResourcePath: String {
        case OAuthAuthorize = "/oauth/authorize"    // 認証ページ
        case OAuthToken     = "/oauth/token"        // アクセストークン取得
        case OAuthRevoke    = "/oauth/revoke"       // アクセストークン失効
        case Works          = "/v1/works"           // 作品情報取得
        case Episodes       = "/v1/episodes"        // エピソード情報取得
        case Records        = "/v1/records"         // エピソードへの記録
        case MeStatuses     = "/v1/me/statuses"     // 作品のステータス設定
        case MeWorks        = "/v1/me/works"        // 自分がステータスを設定している作品の情報
        case MePrograms     = "/v1/me/programs"     // 放送予定を取得
    }
}

// MARK:- Get Params

extension UIWebView {
    
    func loadRequest(_ resourcePath: AnnictApiService.ResourcePath,queryParams: [String:AnyObject]) {
        
        guard let url = URL(string: AnnictApiConst.BaseUrl + resourcePath.rawValue) else {
            return
        }
        
        loadRequest(url, queryParams: queryParams)
    }
    
    func loadRequest(_ url: URL,queryParams: [String:AnyObject]) {
        
        let paramAppendedUrl = "\(url.absoluteString)?\(queryParams.map({"\($0.0)=\($0.1)"}).joined(separator: "&"))"
        guard let url = URL(string: paramAppendedUrl) else {
            return
        }
        
        loadRequest(URLRequest(url: url))
    }
}

enum AnnictErrorType: Error {
    case parseError
}
