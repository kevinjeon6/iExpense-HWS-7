//
//  ExpenseItem.swift
//  iExpense-HWS-7
//
//  Created by Kevin Mattocks on 11/6/22.
//

import Foundation

struct ExpenseItem: Identifiable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Double
}

/*
 let id: UUID can mean that we need to generate a UUID by hand, load, and save the UUID along with our other data. But we can ask Swift to generate a UUID automatically for us - let id = UUID().
 
 Need to modify the ExpenseItem to a new protocol called Identifiable. The only requirement is that there is a property called id that contains a unique identifier.
 
 No longer need to use id: \.id since the ExpenseItems are now guaranteed to be identifiable uniquely
 */
