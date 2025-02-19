//
//  JournalViewModel.swift
//  PJ
//
//  Created by Santo De La Riva on 22/01/25.
//

import Foundation
import SwiftUI

class JournalViewModel: ObservableObject {
    @Published  var entries = [Entry]()

    func deleteEntry(at offsets: IndexSet) {
        entries.remove(atOffsets: offsets)
    }
    
    func calculateTotalCycles(hours: Int, min: Int) -> (Int, Color){
        let cycles: Int = ((hours*60)+min)/90
        var cyclesColor: Color {
            if cycles < 3 {return .red}
            else if cycles <= 4 {return .orange}
            else {return .green}
        }
        return (cycles, cyclesColor)
    }
    
    func calculateTotalMatressTime(entry : Entry) -> Int{
        var total: Int = 0
        
        for activity in entry.mattressTime {
            total += activity.time
        }
        return total
        // Implementation
    }
    
    func checkforValidEntry(entry: Entry) -> Bool{
        var valid: Bool = false
        if entry.minutesSleeping > 0 && entry.score > 0.0 {
            valid = true
        }
        return valid
    }
    
}
