import XCTest
@testable import QuickCache

final class QuickCacheTests: XCTestCase {
    func testDynamicCachedData() {
        let id = 1
        let value = "Test case"
        
        let obj = DynamicCachedData(id: id, value: value)
        obj.saveToCache()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            guard let loaded = DynamicCachedData.loadFromCache(identity: id) else {
                XCTFail("Данные не были загружены из кеша")
                return
            }
            
            XCTAssertEqual(loaded.id, obj.id)
            XCTAssertEqual(loaded.value, obj.value)
        }
    }
    
    func testStaticCachedData() {
        let value = "Test case"
        
        let obj = StaticCachedData(value: value)
        obj.saveToCache()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            guard let loaded = StaticCachedData.loadFromCache() else {
                XCTFail("Данные не были загружены из кеша")
                return
            }
            
            XCTAssertEqual(loaded.value, obj.value)
        }
    }
}
