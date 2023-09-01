//
//  FileManager-DocumentsDirectory.swift
//  BucketList
//
//  Created by 박수호 on 2023/09/02.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
