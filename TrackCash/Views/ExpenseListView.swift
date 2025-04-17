//
//  ExpenseListView.swift
//  TrackCash
//
//  Created by AR-IN-M-120 on 16/04/25.
//

import SwiftUI

struct ExpenseListView: View {
    @ObservedObject var viewModel: ExpenseViewModel
    @State private var selectedExpense: ExpenseEntity?
    @State private var isEditing = false

    var body: some View {
        List {
            ForEach(viewModel.expenses) { expense in
                HStack {
                    VStack(alignment: .leading) {
                        Text(expense.title ?? "")
                            .font(.headline)
                        Text(expense.category ?? "")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    Text("₹\(expense.amount, specifier: "%.2f")")
                }
                .swipeActions(edge: .trailing) {
                    Button(role: .destructive) {
                        viewModel.deleteExpense(expense)
                    } label: {
                        Label("Delete", systemImage: "trash")
                    }

                    Button {
                        selectedExpense = expense
                        isEditing = true
                    } label: {
                        Label("Edit", systemImage: "pencil")
                    }
                    .tint(.orange)
                }
            }
        }
        .sheet(isPresented: $isEditing) {
            if let expenseToEdit = selectedExpense {
                NavigationStack {
                    EditExpenseView(viewModel: viewModel, expense: expenseToEdit)
                }
            }
        }
    }
}


