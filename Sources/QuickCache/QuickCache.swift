//
//  File.swift
//  
//
//  Created by Дмитрий Папков on 28.07.2021.
//

import Foundation
import Cachyr

public class QuickCache {
    public static let main: QuickCache = .init()
    private let cache: DiskCache<Data> = .init()
    
    private init() {
        cache.removeExpired()
    }
    
    subscript(forKey key: String) -> Data? {
        get { self.cache.value(forKey: key) }
        set {
            if let newValue = newValue {
                self.cache.setValue(newValue, forKey: key)
            }
            
            self.cache.removeValue(forKey: key)
        }
    }
    
    public func setExpirationDate(date: Date?, forKey key: String) {
        if let date = date {
            cache.setExpirationDate(date, forKey: key)
        }
    }
    
    public func removeValue(forKey key: String) {
        cache.removeValue(forKey: key)
    }
    
    public func removeItems(olderThan date: Date) {
        self.cache.removeItems(olderThan: date)
    }
    
    public func removeAll() {
        self.cache.removeAll()
    }
}
