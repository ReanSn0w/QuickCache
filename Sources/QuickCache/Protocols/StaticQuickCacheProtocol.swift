//
//  StaticQuickCacheProtocol.swift
//  
//
//  Created by Дмитрий Папков on 28.07.2021.
//

import Foundation

public protocol StaticQuickCacheProtocol: QuickCacheProtocol {
    static var cacheStorageKey: String { get }
}

public extension StaticQuickCacheProtocol {
    static func loadFromCache() -> Self? {
        Self.getCached(with: Self.cacheStorageKey)
    }
    
    func saveToCache() {
        setCached(with: Self.cacheStorageKey)
    }
}
