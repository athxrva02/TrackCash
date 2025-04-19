//
//  EditExpenseView.swift
//  TrackCash
//
//  Created by Atharva Dagaonkar on 17/04/25.
//

import SwiftUI

struct EditExpenseView: View {
    let viewModel: ExpenseViewModel
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var expense: ExpenseEntity

    var body: some View {
        Form {
            TextField("Title", text: Binding(
                get: { expense.title ?? "" },
                set: { expense.title = $0 }
            ))

            TextField("Price", text: Binding(
                get: { String(expense.amount) },
                set: { expense.amount = Double($0) ?? 0.0 }
            ))
            .keyboardType(.decimalPad)

            Picker("Category", selection: Binding(
                get: { expense.category ?? "Food" },
                set: { expense.category = $0 }
            )) {
                ForEach(["Food", "Transport", "Bills", "Shopping", "Others"], id: \.self) {
                    Text($0)
                }
            }

            DatePicker("Date", selection: Binding(
                get: { expense.date ?? Date() },
                set: { expense.date = $0 }
            ))

            Button("Save Changes") {
                (viewModel as ExpenseViewModel).saveContext()
                dismiss()
            }
        }
        .navigationTitle("Edit Expense")
    }
}
