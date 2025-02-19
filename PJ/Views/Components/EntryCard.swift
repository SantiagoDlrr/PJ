//
//  EntryCard.swift
//  PJ
//
//  Created by Santo De La Riva on 19/02/25.
//

import SwiftUI

struct EntryCard: View {
    
    var date: Date = Date()
    var numberOfActivities: Double = 0
    var mattressTime: Double = 0
    var sleepTime: Double = 0
    var score: Int =  0
    
    var backgroundColor: Color = .yellow
    var scoreColor: Color = .green
    
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width: 400, height: 105)
                .foregroundColor(Color(.secondarySystemBackground))
                .shadow(radius: 8)
                .cornerRadius(16)
            HStack{
                
                VStack(alignment: .leading){
                    Text(date.formatted(.dateTime.weekday()))
                        .font(.title2)
                        .bold()
                    Text(date, format: .dateTime.month().day())
                        .font(.subheadline)
                        .bold() // Maybe change it?
                }
                Spacer()
                
                HStack{
                    EntryCardDetail(title: "Acts", metric: numberOfActivities)
                    
                    EntryCardDetail(title: "Matress", metric: mattressTime, percentage: -22.1)
                    
                    EntryCardDetail(title: "Sleep", metric: sleepTime)
                }
                
                Spacer()
                
                Text("90")
                    .font(.title)
                    .bold()
                    .foregroundStyle(scoreColor)
            }
            .frame(width: 350, height: 105)
            
        }
    }
}

#Preview {
    EntryCard()
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
