//
//  ContentView.swift
//  PJ
//
//  Created by Santo De La Riva on 17/01/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var jvm = JournalViewModel()
    
    @State private var tabSelection  = 1
    
    var body: some View {
        
        TabView(selection: $tabSelection){
            SleepView(jvm: jvm)
                .tag(1)
            
            //Calculadora de sueño añadir 2 cuadrados y una luna hasta arriba
            Text("Coming Soon")
                .tag(3)
            
            JournalView(jvm: jvm)
                .tag(2)
        }
        .overlay(alignment: .bottom){
            CustomTabView(selectedIndex: $tabSelection)
        }
        
    }
}

#Preview {
    ContentView()
}

