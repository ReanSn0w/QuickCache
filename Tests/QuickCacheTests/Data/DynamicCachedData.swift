//
//  DynamicCachedData.swift
//  
//
//  Created by Дмитрий Папков on 28.07.2021.
//

import Foundation
import QuickCache

class DynamicCachedData: Codable {
    let id: Int
    let value: String
    
    init(
        id: Int,
        value: String
    ) {
        self.id = id
        self.value = value
    }
}

extension DynamicCachedData: DynamicQuickCacheProtocol {
    typealias IdentityType = Int
    
    static var defaultExpire: Date? { nil }
    
    static func cacheStorageKey(identity: Int) -> String {
        "test_data_\(identity)"
    }
    
    func loadCurrentIdentity() -> Int {
        self.id
    }
}
