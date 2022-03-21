//
//  iDineApp.swift
//  Shared
//
//  Created by Luis Eugenio Santos Gonzalez on 20/03/22.
//

import SwiftUI

@main
struct iDineApp: App {
    let persistenceController = PersistenceController.shared

    @StateObject var order = Order()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
