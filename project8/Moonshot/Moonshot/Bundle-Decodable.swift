//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by 박수호 on 2023/02/05.
//

import Foundation

extension Bundle {
    // generic method로 만들기 위해 함수명 뒤에 <T>를 붙임
    // <T: Codable>로 제약을 걸어둠으로써 Codable을 준수하지 않는 타입은 decode를 사용할 수 없다.
    func decode<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        
        let decoder = JSONDecoder()
        
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }
        
        return loaded
    }
}
