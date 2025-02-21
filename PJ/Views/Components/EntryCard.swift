//
//  EntryCard.swift
//  PJ
//
//  Created by Santo De La Riva on 19/02/25.
//

import SwiftUI

struct EntryCard: View {
    
    @ObservedObject var jvm: JournalViewModel
    
    var date: Date = Date()
    var numberOfActivities: Double = 0
    var mattressTime: Double = 0
    var sleepTime: Double = 0
    var score: Int =  0
    
    var backgroundColor: Color = .yellow
    var scoreColor: Color = .green
    
    var body: some View {
        let entry: Entry = jvm.entries.last ?? Entry(date: Date())
        
        ZStack{
            Rectangle()
                .frame(width: 400, height: 105)
                .foregroundColor(Color(.secondarySystemBackground))
                .shadow(radius: 8)
                .cornerRadius(16)
            HStack{
                
                VStack(alignment: .leading){
                    Text(entry.date.formatted(.dateTime.weekday()))
                        .font(.title2)
                        .bold()
                    Text(entry.date, format: .dateTime.month().day())
                        .font(.subheadline)
                        .bold() // Maybe change it?
                }
                Spacer()
                
                // PercentageResults
                let pr = jvm.calculateAtributePercentageDiff(entry: entry)
                let _ = print(pr)
                
                HStack{
                    EntryCardDetail(title: "Acts", metric: Double(entry.mattressTime.count), percentage: pr[0])
                    
                    EntryCardDetail(title: "Matress", metric: Double(jvm.calculateTotalMatressTime(entry: entry)), percentage: pr[1])
                    
                    EntryCardDetail(title: "Sleep", metric: Double((entry.minutesSleeping/60)), percentage: pr[2])
                }
                
                Spacer()
                
                HStack{
                    Text("\(Int(entry.score))")
                            .font(.title)
                            .bold()
                            .foregroundStyle(scoreColor)
                }.frame(width: 40)
                
            }
            .frame(width: 350, height: 105)
            
        
        }
        
    }
}

#Preview {
    EntryCard(jvm: JournalViewModel())
}

/*GeometryReader { proxy in
 VStack {
     Text("Width: \(proxy.size.width)")
         .background(Color.orange)
         .padding()
     Text("Height: \(proxy.size.height)")
         .background(Color.orange)
         .padding()
 }
}
.background(Color.red)*/
