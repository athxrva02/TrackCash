//
//  AddExpenseView.swift
//  TrackCash
//
//  Created by AR-IN-M-120 on 16/04/25.
//

import SwiftUI
import CoreData

struct AddExpenseView: View {
    @ObservedObject var viewModel: ExpenseViewModel
    @Environment(\.managedObjectContext) private var context
    @Environment(\.dismiss) private var dismiss
    @StateObject private var addViewModel: AddExpenseViewModel

    init(viewModel: ExpenseViewModel) {
        self.viewModel = viewModel
        _addViewModel = StateObject(wrappedValue: AddExpenseViewModel(context: PersistenceController.shared.container.viewContext))
    }

    var body: some View {
        Form {
            TextField("Title", text: $addViewModel.title)
            TextField("Amount", text: $addViewModel.amount)
                .keyboardType(.decimalPad)

            Picker("Category", selection: $addViewModel.category) {
                ForEach(addViewModel.categories, id: \.self) { cat in
                    Text(cat)
                }
            }

            DatePicker("Date", selection: $addViewModel.date, displayedComponents: .date)

            Button("Save Expense") {
                if let expense = addViewModel.createExpense() {
                    viewModel.expenses.append(expense)
                    dismiss()
                }
            }
        }
        .navigationTitle("Add Expense")
    }
}

