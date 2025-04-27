//
//  TrackCashApp.swift
//  TrackCash
//
//  Created by AR-IN-M-120 on 16/04/25.
//

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
            let context = persistenceController.container.viewContext
            let expenseViewModel = ExpenseViewModel(context: context)
            let incomeViewModel = IncomeViewModel(context: context)

            DashboardView(expenseViewModel: expenseViewModel, incomeViewModel: incomeViewModel)
                .environment(\.managedObjectContext, context)
        }
    }
}

#Preview {
    let context = PersistenceController.shared.container.viewContext
    let expenseViewModel = ExpenseViewModel(context: context)
    let incomeViewModel = IncomeViewModel(context: context)

    return DashboardView(expenseViewModel: expenseViewModel, incomeViewModel: incomeViewModel)
        .environment(\.managedObjectContext, context)
}
