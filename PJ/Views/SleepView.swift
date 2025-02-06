//
//  MainScreen.swift
//  PJ
//
//  Created by Santo De La Riva on 20/01/25.
//


// Scrollview??
// Menu

import SwiftUI

struct SleepView: View {
    
    // Dummy data  for Line chart
    // Probablemente tennga que mover esto a un VM
    var chartData: [LineChartData] =  {
        let sampleDate = Date().startOfDay.adding(.month, value: -10)!
        var temp = [LineChartData]()
        
        for i in 0..<8 {
            let value = Double.random(in: 0.0...10.0)
            temp.append(
                LineChartData(
                    date: sampleDate.adding(.month, value: i)!,
                    value: value,
                    type: .outside)
            )
        }
        return temp
    }()
    
    @ObservedObject var jvm: JournalViewModel
    
    var body: some View {
        
        // Top bar (hacerlo componente?)
        NavigationStack{
            
            VStack{
                HStack(alignment: .center){
                    Text("Good Night, \nSantiago")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    HStack{
                        Image(systemName: "bolt.fill")
                            .foregroundColor(.red)
                            .font(.system(size: 24))
                        Text("0")
                            .font(.system(size: 24))
                    }
                }
                .frame(height: 70)
                
                Divider()
                    .frame(height: 2)
                    .overlay(.white)
                
                
                
                // Sleep Stats
                HStack(spacing: 16){
                    TimeSelectorComponent(time: "W")
                    TimeSelectorComponent(time: "M")
                    TimeSelectorComponent(time: "Y")
                }
                .padding(.top, 4)
                
                // Chart
                LineChartView(data: chartData)
                
                
                ZStack{
                    
                    RoundedRectangle(cornerRadius: 18)
                        .fill(Color.white)
                        .frame(width: 380, height: 70)
                                    
                    HStack{
                        VStack (alignment: .leading){
                            Text("Daily Check-In")
                                .font(.headline)
                                .foregroundColor(.black)
                            Text("Hoe was your night?")
                                .font(.subheadline)
                                .foregroundColor(.black)
                        }
                        
                        Spacer()
                        
                        NavigationLink{
                            AddEntryView(jvm: jvm)
                        }label: {
                            Text("Check-In")
                                .padding()
                            
                        }
                        .foregroundColor(.white)
                        .background(.black)
                        .cornerRadius(9)
                        
                    }
                    .padding(18)
                }.padding(.top, 4)
    
                
                Spacer()
            }
            .padding(24)
        }
    }
}

#Preview {
    SleepView(jvm: JournalViewModel())
}

