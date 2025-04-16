//
//  AddExpenseViewModel.swift
//  TrackCash
//
//  Created by AR-IN-M-120 on 16/04/25.
//

import Foundation
import Combine

class AddExpenseViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var amount: String = ""
    @Published var category: String = "Food"
    @Published var date: Date = Date()

    let categories = ["Food", "Transport", "Bills", "Shopping", "Others"]

    func isValid() -> Bool {
        !title.isEmpty && Double(amount) != nil
    }

    func createExpense() -> Expense? {
        guard let amountValue = Double(amount), isValid() else { return nil }
        return Expense(title: title, amount: amountValue, category: category, date: date)
    }
}
