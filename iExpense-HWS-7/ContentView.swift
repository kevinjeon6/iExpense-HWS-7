//
//  ContentView.swift
//  iExpense-HWS-7
//
//  Created by Kevin Mattocks on 10/30/22.
//

import SwiftUI




struct ContentView: View {
    
    @AppStorage("tapCount") private var tapCount = 0
    //tapCount is the UserDefaults key name and is case sensitive. This is where we store the data
    //@AppStorage works like @State. When the value changes, it will reinvoke the body property so the UI reflects the new data
    
    var body: some View {
        Button {
            tapCount += 1
           
        } label: {
            Text("Tap count: \(tapCount)")
        }

        
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
