//
//  DashboardView.swift
//  TrackCash
//
//  Created by AR-IN-M-120 on 16/04/25.
//

import SwiftUI

struct DashboardView: View {
    @ObservedObject var viewModel: ExpenseViewModel

    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                SummaryView(viewModel: viewModel)

                NavigationLink(destination: AddExpenseView(viewModel: viewModel)) {
                    Label("Add Expense", systemImage: "plus.circle")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }

                ExpenseListView(expenses: viewModel.expenses)
            }
            .padding()
            .navigationTitle("Expense Tracker")
        }
    }
}


