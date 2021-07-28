//
//  StaticCachedData.swift
//  
//
//  Created by Дмитрий Папков on 28.07.2021.
//

import Foundation
import QuickCache

class StaticCachedData: Codable {
    let value: String
    
    init(value: String) {
        self.value = value
    }
}

extension StaticCachedData: StaticQuickCacheProtocol {
    static var cacheStorageKey: String { "static_cached_data" }
    static var defaultExpire: Date? { nil }
}
