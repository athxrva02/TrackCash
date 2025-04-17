//
//  AddExpenseViewModel.swift
//  TrackCash
//
//  Created by AR-IN-M-120 on 16/04/25.
//

import Foundation
import CoreData

class AddExpenseViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var amount: String = ""
    @Published var category: String = "Food"
    @Published var date: Date = Date()

    let categories = ["Food", "Transport", "Bills", "Shopping", "Others"]

    private var context: NSManagedObjectContext

    init(context: NSManagedObjectContext) {
        self.context = context
    }

    func isValid() -> Bool {
        !title.isEmpty && Double(amount) != nil
    }

    func createExpense() -> ExpenseEntity? {
        guard let amountValue = Double(amount), isValid() else { return nil }

        let expense = ExpenseEntity(context: context)
        expense.title = title
        expense.amount = amountValue
        expense.category = category
        expense.date = date

        do {
            try context.save()
            return expense
        } catch {
            print("Failed to save expense: \(error.localizedDescription)")
            return nil
        }
    }
}

