//
//  TrackCashApp.swift
//  TrackCash
//
//  Created by AR-IN-M-120 on 16/04/25.
//

import SwiftUI

@main
struct TrackCashApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            DashboardView(viewModel: ExpenseViewModel(context: persistenceController.container.viewContext))
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

#Preview {
    let context = PersistenceController.shared.container.viewContext
    let viewModel = ExpenseViewModel(context: context)
    return DashboardView(viewModel: viewModel)
        .environment(\.managedObjectContext, context)
}

