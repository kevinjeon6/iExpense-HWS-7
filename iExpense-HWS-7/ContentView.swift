//
//  ContentView.swift
//  iExpense-HWS-7
//
//  Created by Kevin Mattocks on 10/30/22.
//

import SwiftUI

struct SecondView: View {
    
    @Environment(\.dismiss) var dismiss
    
    let name: String
    
    var body: some View {
        Button {
            dismiss()
        } label: {
            Text("Dismiss")
        }

    }
}


struct ContentView: View {
    
    @State private var isShowingSheet = false
    
 
    
    var body: some View {
        Button {
            isShowingSheet.toggle()
           
        } label: {
            Text("Show Sheet")
        }
        .sheet(isPresented: $isShowingSheet) {
            SecondView(name: "Kevin")
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

/*
 How to make a view dismiss itself
 */
