//
//  Expense.swift
//  TrackCash
//
//  Created by AR-IN-M-120 on 16/04/25.
//

import Foundation

struct Expense: Identifiable, Codable {
    var id = UUID()
    let title: String
    let amount: Double
    let category: String
    let date: Date
}
