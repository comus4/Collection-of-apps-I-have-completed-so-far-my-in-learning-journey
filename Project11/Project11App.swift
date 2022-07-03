//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Comus Hardman following 100 Days of SwiftUI by Paul Hudson.
//

import SwiftUI

@main
struct BookwormApp: App {
    @StateObject private var dataController = DataController()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
