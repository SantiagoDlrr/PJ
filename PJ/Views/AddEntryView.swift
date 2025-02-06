//
//  AddEntryView.swift
//  PJ
//
//  Created by Santo De La Riva on 22/01/25.
//

import SwiftUI

struct AddEntryView: View {
    
    @ObservedObject var jvm : JournalViewModel
    
    @State var neWEntry: Entry = Entry()
    @State var selectedDate = Date()
    @State var hoursOfSleep: Int = 0
    @State var minutesOfSleep: Int = 0
    
    @State var note = ""
    
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 8){
            
            Text("Add your entry")
                .font(.title)
                .fontWeight(.semibold)
                .padding(.bottom)

            
            Divider()
                .frame(height: 2)
                .overlay(.white)
            
            DatePicker(
                "Start Date",
                selection: $selectedDate,
                in: Date.now...Date.distantFuture,
                displayedComponents: [.date]
            )
            .padding(.top, 8)
            
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
            
                        
            HStack{
                Text("Score (0.0 - 10)")
                Spacer()
                Text("3.3")
            }
            
            
            //Simple matress time act1,2,3 and the times
            
            Spacer()
            
            Text("Add a note about your sleep")
            TextField("Note", text: $note, axis: .vertical)
                .lineLimit(3, reservesSpace: true)
                .textFieldStyle(.roundedBorder)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke()
                )
            
            Spacer()
            
            HStack{
                Text("Cycles Sleeped")
                Spacer()
                Text("3.3 C")
            }.padding(.top, 16)

            HStack{
                Text("Total Mattres Time")
                Spacer()
                Text("3.3 hrs")
            }.padding(.vertical, 16)
            
            
            HStack(){
                Button{
                    jvm.entries.append(neWEntry)
                    print(jvm.entries)
                }
                label: {
                    Text("Add New Entry")
                        .padding()
                }
                .foregroundColor(.black)
                .background(.white)
                .cornerRadius(9)
            }
            .frame(maxWidth: .infinity, alignment: .center)
            
        
        }
        .padding(20)
    }
}


#Preview {
    AddEntryView(jvm: JournalViewModel())
}
