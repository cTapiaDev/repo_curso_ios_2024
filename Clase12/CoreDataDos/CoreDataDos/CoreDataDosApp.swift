//
//  CoreDataDosApp.swift
//  CoreDataDos
//
//  Created by Cony Pierola on 10-12-24.
//

import SwiftUI

@main
struct CoreDataDosApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
