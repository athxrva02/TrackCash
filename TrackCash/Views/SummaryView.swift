//
//  SummaryView.swift
//  TrackCash
//
//  Created by AR-IN-M-120 on 16/04/25.
//

import SwiftUI

struct SummaryView: View {
    @ObservedObject var viewModel: ExpenseViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("This Week: \(currencyFormatter.string(from: NSNumber(value: viewModel.weeklyTotal)) ?? "₹0.00")")
            Text("This Month: \(currencyFormatter.string(from: NSNumber(value: viewModel.monthlyTotal)) ?? "₹0.00")")
            Text("All Time: \(currencyFormatter.string(from: NSNumber(value: viewModel.total)) ?? "₹0.00")")
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color(.secondarySystemBackground))
        .cornerRadius(10)
    }
    
    
    private var currencyFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "INR"
        return formatter
    }
}

