//
//  ExpenseViewModel.swift
//  TrackCash
//
//  Created by AR-IN-M-120 on 16/04/25.
//

import Foundation
import CoreData

class ExpenseViewModel: ObservableObject {
    private let context: NSManagedObjectContext
    @Published var expenses: [ExpenseEntity] = []

    init(context: NSManagedObjectContext) {
        self.context = context
        fetchExpenses()
    }

    func fetchExpenses() {
        let request: NSFetchRequest<ExpenseEntity> = ExpenseEntity.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(keyPath: \ExpenseEntity.date, ascending: false)]

        do {
            expenses = try context.fetch(request)
        } catch {
            print("Fetch error: \(error)")
        }
    }

    func addExpense(title: String, amount: Double, category: String, date: Date) {
        let newExpense = ExpenseEntity(context: context)
        newExpense.title = title
        newExpense.amount = amount
        newExpense.category = category
        newExpense.date = date

        save()
    }

    func deleteExpense(_ expense: ExpenseEntity) {
        context.delete(expense)
        save()
    }

    private func save() {
        do {
            try context.save()
            fetchExpenses()
        } catch {
            print("Save error: \(error)")
        }
    }

    // Calculations
    var total: Double {
        expenses.reduce(0) { $0 + $1.amount }
    }

    var weeklyTotal: Double {
        let oneWeekAgo = Calendar.current.date(byAdding: .day, value: -7, to: Date())!
        return expenses.filter { $0.date ?? Date() >= oneWeekAgo }.reduce(0) { $0 + $1.amount }
    }

    var monthlyTotal: Double {
        let startOfMonth = Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: Date()))!
        return expenses.filter { $0.date ?? Date() >= startOfMonth }.reduce(0) { $0 + $1.amount }
    }
}

