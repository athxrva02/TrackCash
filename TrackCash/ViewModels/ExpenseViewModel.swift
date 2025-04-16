//
//  ExpenseViewModel.swift
//  TrackCash
//
//  Created by AR-IN-M-120 on 16/04/25.
//

import Foundation
import Combine

class ExpenseViewModel: ObservableObject {
    @Published var expenses: [Expense] = []

    var total: Double {
        expenses.reduce(0) { $0 + $1.amount }
    }

    var weeklyTotal: Double {
        let oneWeekAgo = Calendar.current.date(byAdding: .day, value: -7, to: Date()) ?? Date()
        return expenses.filter { $0.date >= oneWeekAgo }.reduce(0) { $0 + $1.amount }
    }

    var monthlyTotal: Double {
        let startOfMonth = Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: Date())) ?? Date()
        return expenses.filter { $0.date >= startOfMonth }.reduce(0) { $0 + $1.amount }
    }

    func addExpense(title: String, amount: String, category: String, date: Date) {
        guard let amountValue = Double(amount) else { return }
        let newExpense = Expense(title: title, amount: amountValue, category: category, date: date)
        expenses.append(newExpense)
    }
}
