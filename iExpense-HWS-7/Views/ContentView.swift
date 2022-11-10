//
//  ContentView.swift
//  iExpense-HWS-7
//
//  Created by Kevin Mattocks on 10/30/22.
//

import SwiftUI




struct ContentView: View {
    
    @StateObject var expenses = ExpenseViewModel()
    @State private var showingAddExpense = false
    

    
    var body: some View {
        NavigationView {
            List {
                //id of \.name tells the ForEach to identify each expense item uniquely by its name
                ForEach(expenses.items) { item in
                    HStack {
                        VStack {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        Spacer()
                        
                        Text(item.amount, format: .currency(code: "USD"))
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }

            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    
    //MARK: - Method
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

/*
 onDelete modifier only works with ForEach. So if you want the user to delete items, you need to put them inside a ForEach
 
 
 
 UserDefaults is storing small amount of data. Aim to store no more than 512 KB
 Store things like when was the last time the user launched the app, which news story they lasat read, or other passively collected information
  
 
 SwiftUI can wrap up UserDefaults inside a property wrapper called @AppStorage
 */
