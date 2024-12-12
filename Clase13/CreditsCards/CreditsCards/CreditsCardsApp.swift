//
//  CreditsCardsApp.swift
//  CreditsCards
//
//  Created by Cony Pierola on 11-12-24.
//

import SwiftUI

@main
struct CreditsCardsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
