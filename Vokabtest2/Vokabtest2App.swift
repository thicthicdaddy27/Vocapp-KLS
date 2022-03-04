//
//  Vokabtest2App.swift
//  Vokabtest2
//
//  Created by Luca Scheller on 22.02.22.
//

import SwiftUI

@main
struct Vokabtest2App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
