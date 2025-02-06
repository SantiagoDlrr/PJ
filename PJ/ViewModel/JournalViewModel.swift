//
//  JournalViewModel.swift
//  PJ
//
//  Created by Santo De La Riva on 22/01/25.
//

import Foundation

class JournalViewModel: ObservableObject {
    @Published  var entries = [Entry]()
    
    
    
    func deleteEntry(at offsets: IndexSet) {
        entries.remove(atOffsets: offsets)
    }
    
    func calculateTotalCycles(){
        
    }
    
    func calculateTotalMatressTime(){
        // Implementation
    }
    
}
