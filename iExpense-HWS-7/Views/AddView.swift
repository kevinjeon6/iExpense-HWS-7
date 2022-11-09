//
//  AddView.swift
//  iExpense-HWS-7
//
//  Created by Kevin Mattocks on 11/8/22.
//

import SwiftUI

struct AddView: View {
    
    //We aren't creating it but saying it exists
    @ObservedObject var expenses: ExpenseViewModel
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    let types = ["Business", "Personal"]
    
    
    var body: some View {
        NavigationView{
            Form {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Amount", value: $amount, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
                
                
            }
            .navigationTitle("Add new expense")
            .toolbar {
                Button {
                    let item = ExpenseItem(name: name, type: type, amount: amount)
                    expenses.items.append(item)
                } label: {
                    Text("Save")
                }

            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: ExpenseViewModel())
    }
}
//
