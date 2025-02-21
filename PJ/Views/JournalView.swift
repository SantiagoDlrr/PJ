//
//  JournalView.swift
//  PJ
//
//  Created by Santo De La Riva on 21/01/25.
//


// Option I re ident|
// Text("Third Añadir 3 averages: sleep, score, colchóntime, añadir perfil (buscarme un yutu tutorial para ver que me saco, y Days like fitnesPal")
import SwiftUI


struct JournalView : View {
    
    @ObservedObject var jvm : JournalViewModel
    
    
    var body: some View {
        
        VStack(){
            HStack(alignment: .center){
                Text("Your Entries")
                    .font(.title)
                    .fontWeight(.bold)
                
                Spacer()
                
                HStack{
                    Image(systemName: "moon.fill")
                        .foregroundColor(Color(.myYellow))
                        .font(.system(size: 24))
                }
            }
            .frame(height: 70)
            
            Divider()
                .frame(width: 380, height: 2)
                .overlay(.white)
            
            
            Spacer()
            
            ScrollView{
                ForEach(jvm.entries.reversed()){entry in
                    EntryCard(jvm: jvm, entry: entry)
                }
            }
            .padding(.top, 8)
        }
        .padding(24)

            
    
        
        /* Creo que aquí me falta un vstack
        
        
        // Buttons
        HStack(alignment: VerticalAlignment.center){
            
            // Add new entry
            NavigationLink(destination: AddEntryView(jvm: jvm)){
                Text("Add New Entry")
                    .foregroundStyle(.blue)
            }
            
            
            Spacer()
            
            // Edit entry
            Button("January"){
                print("edited")
            }
            .foregroundStyle(.blue)
            
            Button{
                print("que")
                print(jvm.entries)
                
                
            } label: {
                Image(systemName: "line.3.horizontal.decrease.circle")
            }
        }
        .padding(.vertical, 8)
        
        
        
        
        // Entries
        
        
        Grid(alignment: .trailing, horizontalSpacing: 15, verticalSpacing: 10){
            
            GridRow{
                Text("Date")
                    .gridCellAnchor(.center)
                //Color.clear
                //  .gridCellUnsizedAxes([.horizontal, .vertical])
                Text("Cycles")
                    .gridCellAnchor(.center)
                Text("Sleep")
                    .gridCellAnchor(.center)
                Text("Score")
                    .gridCellAnchor(.center)
            }
            
            // Creo aquí tiene una id
            ForEach(vm.entries){ entry in
                GridRow{
                    Text(entry.date, style: .date)
                    Text(String(entry.cycles))
                        .gridCellAnchor(.center)
                    Text(String(entry.hourOfSleep))
                    Text(String(entry.score))
                }
                
            }
        }*/
        
    }
}

#Preview {
    JournalView(jvm: JournalViewModel())
}
