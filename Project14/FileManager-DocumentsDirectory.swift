//
//  FileManager-DocumentsDirectory.swift
//  Bucketlist
//
//  Created by Comus Hardman following 100 Days of SwiftUI by Paul Hudson.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
