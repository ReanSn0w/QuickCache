//
//  QuickCacheProtocol.swift
//  
//
//  Created by Дмитрий Папков on 28.07.2021.
//

import Foundation

public protocol QuickCacheProtocol: Codable {
    static var defaultExpire: Date? { get }
}

extension QuickCacheProtocol {
    static func getCached(with identity: String) -> Self? {
        guard let data = QuickCache.main[forKey: identity],
              let object = try? JSONDecoder().decode(Self.self, from: data)
        else {
            return nil
        }
        
        return object
    }
    
    func setCached(with identity: String) {
        guard let data = try? JSONEncoder().encode(self) else {
            return
        }
        
        QuickCache.main[forKey: identity] = data
        QuickCache.main.setExpirationDate(date: Self.defaultExpire, forKey: identity)
    }
}
