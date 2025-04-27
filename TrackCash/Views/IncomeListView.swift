//
//  IncomeListView.swift
//  TrackCash
//
//  Created by Atharva Dagaonkar on 27/04/25.
//

import SwiftUI

struct IncomeListView: View {
    @ObservedObject var viewModel: IncomeViewModel

    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.incomes, id: \.self) { income in
                    VStack(alignment: .leading) {
                        Text(income.title ?? "")
                            .font(.headline)
                        Text("₹\(income.amount, specifier: "%.2f")")
                            .font(.subheadline)
                        Text(income.date ?? Date(), style: .date)
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
                .onDelete(perform: deleteIncome)
            }
            .navigationTitle("Income History")
            .toolbar {
                EditButton()
            }
        }
    }

    private func deleteIncome(at offsets: IndexSet) {
        offsets.forEach { index in
            let income = viewModel.incomes[index]
            viewModel.deleteIncome(income)
        }
    }
}
