//
//  Expenses.swift
//  iExpense-HWS-7
//
//  Created by Kevin Mattocks on 11/6/22.
//

import Foundation


class ExpenseViewModel: ObservableObject {
    @Published var items = [ExpenseItem]()
}
