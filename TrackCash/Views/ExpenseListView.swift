//
//  ExpenseListView.swift
//  TrackCash
//
//  Created by AR-IN-M-120 on 16/04/25.
//

import SwiftUI

struct ExpenseListView: View {
    var expenses: [Expense]
    
    var body: some View {
        List {
            ForEach(expenses) { expense in
                HStack {
                    VStack(alignment: .leading) {
                        Text(expense.title)
                            .font(.headline)
                        Text(expense.category)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    Text(String(format: "%.2f", expense.amount))
                }
            }
        }
    }
}
