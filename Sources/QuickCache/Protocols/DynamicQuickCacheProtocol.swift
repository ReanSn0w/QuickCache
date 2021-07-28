//
//  DynamicQuickCacheProtocol.swift
//  
//
//  Created by Дмитрий Папков on 28.07.2021.
//

import Foundation

public protocol DynamicQuickCacheProtocol: QuickCacheProtocol {
    associatedtype IdentityType: Hashable
    
    static func cacheStorageKey(identity: IdentityType) -> String
    func loadCurrentIdentity() -> IdentityType
}

public extension DynamicQuickCacheProtocol {
    static func loadFromCache(identity: IdentityType) -> Self? {
        Self.getCached(with: Self.cacheStorageKey(identity: identity))
    }
    
    func saveToCache() {
        setCached(with: Self.cacheStorageKey(identity: self.loadCurrentIdentity()))
    }
}
