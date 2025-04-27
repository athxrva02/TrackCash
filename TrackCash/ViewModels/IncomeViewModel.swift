//
//  IncomeViewModel.swift
//  TrackCash
//
//  Created by Atharva Dagaonkar on 27/04/25.
//

import Foundation
import CoreData

class IncomeViewModel: ObservableObject {
    @Published var incomes: [IncomeEntity] = []
    private let viewContext: NSManagedObjectContext
    
    init (context: NSManagedObjectContext) {
        self.viewContext = context
        fetchIncomes()
    }
    
    func fetchIncomes() {
        let request: NSFetchRequest<IncomeEntity> = IncomeEntity.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(keyPath: \IncomeEntity.date, ascending: false)]
        
        do {
            incomes = try viewContext.fetch(request)
        } catch {
            print("Failed to fetch incomes: \(error.localizedDescription)");
            incomes = []
        }
    }
    
    func addIncome(title: String, amount: Double, date: Date){
        let newIncome = IncomeEntity(context: viewContext)
        newIncome.title = title
        newIncome.amount = amount
        newIncome.date = date
        
        saveContext()
        fetchIncomes()
    }
    
    func deleteIncome(_ income: IncomeEntity){
        viewContext.delete(income)
        saveContext()
        fetchIncomes()
    }
    
    func saveContext() {
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            } catch {
                print("Failed to save income: \(error.localizedDescription)")
            }
        }
    }
    
    var totalIncome: Double {
        incomes.reduce(0) {
            $0 + $1.amount
        }
    }
    
    
}
