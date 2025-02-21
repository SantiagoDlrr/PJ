//
//  Entry.swift
//  PJ
//
//  Created by Santo De La Riva on 19/01/25.
//

/*Info of: 🤓👆activities you do before really sleeping such as: lying in bed trying to sleep, reading a book or playing an instrument, preferabely avoiding screen light*/
// Agregar que el laying in bed si sea forzoso y que calcule tu effective sleep?
// The average time it takes a healthy person to fall asleep is 10–20 minutes, but it can vary from person to person. This time is known as sleep latency.


import Foundation

struct Entry: Identifiable{
    
  
    let id = UUID()
    
    var date: Date = Date()
    var minutesSleeping: Int = 0
    var cycles: Int = 0
    var score: Double = 0
    var note: String = ""
    var mattressTime: [activity] = [activity(name: "Lying in bed", time: 0)]
    
    
    
    
    
    static let sampleData = [
        Entry(date: Date(), minutesSleeping: 300, cycles: 5, score: 10, mattressTime: [activity(name: "Lying in bed", time: 10)]),
        Entry(date: Calendar.current.date(byAdding: .day, value: -1, to: Date())!, minutesSleeping: 150, cycles: 5, score: 8.2, mattressTime: [activity(name: "Lying in bed", time: 0)]),
        /*Entry(id: UUID(), date: Calendar.current.date(byAdding: .day, value: -1, to: Date())!, cycles: 4, hourOfSleep: "6h 45m", score: 7.5),
        Entry(id: UUID(), date: Calendar.current.date(byAdding: .day, value: -2, to: Date())!, cycles: 6, hourOfSleep: "8h 15m", score: 9.0),
        Entry(id: UUID(), date: Calendar.current.date(byAdding: .day, value: -3, to: Date())!, cycles: 3, hourOfSleep: "5h 10m", score: 6.3),
        Entry(id: UUID(), date: Calendar.current.date(byAdding: .day, value: -4, to: Date())!, cycles: 5, hourOfSleep: "7h 0m", score: 7.8),
    */]
}

struct activity: Identifiable {
    let id = UUID()
    var name: String = ""
    var time: Int = 0
}
