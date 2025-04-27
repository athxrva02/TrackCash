//
//  AddIncomeViewModel.swift
//  TrackCash
//
//  Created by Atharva Dagaonkar on 27/04/25.
//

import Foundation

class AddIncomeViewModel:ObservableObject {
    @Published var title:String = ""
    @Published var amount:String = ""
    @Published var date:Date = Date()
    
    func isValid() -> Bool {
        !title.isEmpty && Double(amount) != nil
    }
    
    func clear() {
        title = ""
        amount = ""
        date = Date()
    }
}
