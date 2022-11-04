//
//  ContentView.swift
//  iExpense-HWS-7
//
//  Created by Kevin Mattocks on 10/30/22.
//

import SwiftUI

struct User: Codable {
    let firstName: String
    let lastName: String
    
    
}

//Codable is a protocol for archiving and unarching data
//JSONEncoder is used when we need to tell Swift when to archive and what to do with the data


struct ContentView: View {
    
   @State private var user = User(firstName: "Kevin", lastName: "Jeon")
    
    var body: some View {
        Button {
            let encoder = JSONEncoder()
            
            
            //the constant name data is a new data type. Designed to store any kind of data
            if let data = try? encoder.encode(user) {
                UserDefaults.standard.set(data, forKey: "UserData")
            }
           
        } label: {
            Text("Save User")
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
