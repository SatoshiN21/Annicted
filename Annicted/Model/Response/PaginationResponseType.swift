//
//  PaginationResponseType.swift
//  Annicted
//
//  Created by Satoshi Nagasaka on 2016/08/24.
//  Copyright © 2016年 SatoshiN21. All rights reserved.
//

import Himotoki

protocol PaginationResponseType {
    associatedtype Element: Decodable
    
    var elements: [Element] { get }
    
    init(elements: [Element])
}
