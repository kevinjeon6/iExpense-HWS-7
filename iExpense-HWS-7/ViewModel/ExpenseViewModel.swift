//
//  Expenses.swift
//  iExpense-HWS-7
//
//  Created by Kevin Mattocks on 11/6/22.
//

import Foundation


class ExpenseViewModel: ObservableObject {
    @Published var items = [ExpenseItem]() {
        //Allow the user to save items when added
        didSet {
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    
    init(){
        //Read data from UserDefaults forKey "Items"
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            //If you can read that, then decode that.
            //[ExpenseItem].self     .self is referring to the idea of array of items
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
         items = []
    }
    
}
