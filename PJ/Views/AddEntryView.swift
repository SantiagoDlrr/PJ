//
//  AddEntryView.swift
//  PJ
//
//  Created by Santo De La Riva on 22/01/25.
//

import SwiftUI

struct AddEntryView: View {
    
    @ObservedObject var jvm : JournalViewModel
    @EnvironmentObject var navManager : NavigationManager
    
    @State var newEntry: Entry = Entry()
    @State var selectedDate = Date()
    @State var hoursOfSleep: Int = 0
    @State var minutesOfSleep: Int = 0
    @State var score: Double = 0
    
    var body: some View {
        
        @State var continueButtonStatus = score > 0  && hoursOfSleep > 0
        VStack(alignment: .leading, spacing: 8){
            
            Text("Add your entry")
                .font(.title)
                .fontWeight(.semibold)
                .padding(.bottom)

            
            Divider()
                .frame(height: 2)
                .overlay(.white)
            
            // Start Date
            DatePicker(
                "Sleep Date",
                selection: $selectedDate,
                in: Date.now...Date.distantFuture,
                displayedComponents: [.date]
            )
            .padding(.top, 8)
            
            // Sleeping Time
            HStack{
                Text("Sleeping Time")
                
                Spacer()
                
                HStack {
                    Picker("Dude", selection: $hoursOfSleep) {
                        ForEach(0..<13){i in
                            Text("\(i) hrs").tag(i)
                        }.pickerStyle(WheelPickerStyle())
                    }
                    
                    
                    Picker("Dude", selection: $minutesOfSleep) {
                        ForEach(0..<61){i in Text("\(i) min").tag(i)
                        }.pickerStyle(WheelPickerStyle())
                    }
                    .padding(.leading, -20)
                }.background(Color.white)

            }
            
            // Score
            HStack{
                Text("Score (0 - 100)")
                Spacer()
                TextField("0.0 - 10", value: $score, formatter: NumberFormatter())
                    .frame(width: 80)
                    .multilineTextAlignment(.center)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding(.bottom, 20)
            
            // Mattress Time
            Text("Matress Time")
                .font(.title2)
                .fontWeight(.semibold)

            // aquí lleva un binding? para actualizar entries?? como en $scoreboard.player
            
            ScrollView{
                ForEach(Array($newEntry.mattressTime.enumerated()), id: \.0){ (index, $item) in
                    HStack{
                        TextField("Activity #\(index+1)", text: $item.name)
                        Spacer()
                        Picker("Dude", selection: $item.time) {
                            ForEach(0..<61){i in Text("\(i) min").tag(i)
                            }.pickerStyle(WheelPickerStyle())
                        }
                        .background(Color.white)
                    }
                }
            }
            
                
                Button("Add Activity", systemImage: "plus") {
                    newEntry.mattressTime.append(activity())
                }
                .padding(.bottom, 16)

            
            //Simple matress time act1,2,3 and the times
            
            /*Text("Add a note about your sleep")
            TextField("Note", text: $note, axis: .vertical)
                .lineLimit(3, reservesSpace: true)
                .textFieldStyle(.roundedBorder)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke()
        
                )*/
            
            let cycleInfo = jvm.calculateTotalCycles(hours: hoursOfSleep, min: minutesOfSleep)
            
            VStack{
                HStack{
                    Text("Cycles Sleeped")
                    Spacer()
                    Text("\(cycleInfo.0)")
                        .foregroundStyle(cycleInfo.1)
                }.padding(.top, 16)
                
                HStack{
                    Text("Total Mattres Time (min)")
                    Spacer()
                    Text("\(jvm.calculateTotalMatressTime(entry: newEntry))")
                }.padding(.vertical, 16)
            }
            .padding(.horizontal, 16)
            .overlay{
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.gray, lineWidth: 2)
            }
            
            Spacer(minLength: 8)
            
            
            /*Button("status"){
                print(continueButtonStatus)
                print(newEntry)
            }*/
            
            HStack(){
                Button{
                    newEntry.date = selectedDate
                    newEntry.minutesSleeping = (hoursOfSleep*60)+minutesOfSleep
                    newEntry.cycles =  cycleInfo.0
                    newEntry.score = score
                    jvm.entries.append(newEntry)
                    print(newEntry)
                    
                    navManager.path.append("entry2")
                    
                }
                label: {
                    Text("Continue")
                        .padding()
                }
                .foregroundColor(.black)
                .background(continueButtonStatus ? .white : .gray)
                .cornerRadius(9)
                .disabled(!continueButtonStatus)
            }
            .frame(maxWidth: .infinity, alignment: .center)
            
        
        }
        .padding(16)
        .frame(maxHeight: 650)
    }
}


#Preview {
    AddEntryView(jvm: JournalViewModel())
}
