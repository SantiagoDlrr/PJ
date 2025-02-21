//
//  JournalViewModel.swift
//  PJ
//
//  Created by Santo De La Riva on 22/01/25.
//

import Foundation
import SwiftUI

class JournalViewModel: ObservableObject {
    @Published  var entries = [
        Entry(date: Calendar.current.date(byAdding: .day, value: -1, to: Date())!, minutesSleeping: 150, cycles: 5, score: 8.2, mattressTime: [activity(name: "Lying in bed", time: 0)]),
        Entry(date: Date(), minutesSleeping: 300, cycles: 5, score: 95, mattressTime: [activity(name: "Lying in bed", time: 10)])
        ]
    
    var sampleData = [
        Entry(date: Calendar.current.date(byAdding: .day, value: -1, to: Date())!, minutesSleeping: 150, cycles: 5, score: 8.2, mattressTime: [activity(name: "Lying in bed", time: 0)]),
        Entry(date: Date(), minutesSleeping: 300, cycles: 5, score: 10, mattressTime: [activity(name: "Lying in bed", time: 10)])
        ]

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
    
    func calculateAtributePercentageDiff(entry: Entry) -> [Double]{
        if let idx = entries.firstIndex(where:{$0.id == entry.id}){
            if idx == 0{
                return [0.0,0.0,0.0]
                
            }else{
                let arr1 = capAuxiliar(entry: entry)
                let arr2 = capAuxiliar(entry: entries[idx - 1])
                
                var diff: [Double] = []
                for (x, y) in zip(arr1, arr2) {
                    if y == 0 {
                        diff.append(0)
                    }
                    else {diff.append(((x-y)/y)*100)}
                }
                return diff
            }
        }
        return [-100,-100,-100]
        
    }
    
    func capAuxiliar(entry: Entry) -> [Double]{
        
        return [
            Double(entry.mattressTime.count),
            Double(calculateTotalMatressTime(entry: entry)),
            Double(entry.minutesSleeping)
        ]
    }
    
    
    func checkforValidEntry(entry: Entry) -> Bool{
        var valid: Bool = false
        if entry.minutesSleeping > 0 && entry.score > 0.0 {
            valid = true
        }
        return valid
    }
    
    
}
