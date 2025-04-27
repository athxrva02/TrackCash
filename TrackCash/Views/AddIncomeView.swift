//
//  AddIncomeView.swift
//  TrackCash
//
//  Created by Atharva Dagaonkar on 27/04/25.
//

import SwiftUI

struct AddIncomeView: View {
    @ObservedObject var viewModel: IncomeViewModel
    @StateObject private var addViewModel = AddIncomeViewModel()
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Title", text: $addViewModel.title)
                TextField("Amount", text: $addViewModel.amount).keyboardType(.decimalPad)
                DatePicker("Date", selection: $addViewModel.date, displayedComponents: .date)
                
                Button("Save") {
                    if addViewModel.isValid(), let amount = Double(addViewModel.amount) {
                        viewModel.addIncome(title: addViewModel.title, amount: amount, date: addViewModel.date)
                        dismiss()
                    }
                }
            }
            .navigationTitle("Add Income")
        }
    }
}
