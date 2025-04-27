//
//  DashboardView.swift
//  TrackCash
//
//  Created by AR-IN-M-120 on 16/04/25.
//

import SwiftUI

struct DashboardView: View {
    @StateObject private var expenseViewModel: ExpenseViewModel
    @StateObject private var incomeViewModel: IncomeViewModel

    init(expenseViewModel: ExpenseViewModel, incomeViewModel: IncomeViewModel) {
        _expenseViewModel = StateObject(wrappedValue: expenseViewModel)
        _incomeViewModel = StateObject(wrappedValue: incomeViewModel)
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Total Income: ₹\(incomeViewModel.totalIncome, specifier: "%.2f")")
                    .font(.title2)
                    .bold()

                Text("Total Expenses: ₹\(expenseViewModel.total, specifier: "%.2f")")
                    .font(.title2)
                    .bold()

                Text("Remaining Budget: ₹\((incomeViewModel.totalIncome - expenseViewModel.total), specifier: "%.2f")")
                    .font(.title2)
                    .bold()
                    .foregroundColor((incomeViewModel.totalIncome - expenseViewModel.total) < 0 ? .red : .green)

                Spacer()

                HStack {
                    NavigationLink("Add Expense") {
                        AddExpenseView(viewModel: expenseViewModel)
                    }
                    .buttonStyle(.borderedProminent)

                    NavigationLink("Add Income") {
                        AddIncomeView(viewModel: incomeViewModel)
                    }
                    .buttonStyle(.borderedProminent)
                }
                
                HStack {
                    NavigationLink("Expense History") {
                        ExpenseListView(viewModel: expenseViewModel)
                    }
                    .buttonStyle(.bordered)

                    NavigationLink("Income History") {
                        IncomeListView(viewModel: incomeViewModel)
                    }
                    .buttonStyle(.bordered)
                }
            }
            .padding()
            .navigationTitle("Dashboard")
        }
    }
}

