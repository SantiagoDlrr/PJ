//
//  AddNoteView.swift
//  PJ
//
//  Created by Santo De La Riva on 16/02/25.
//

import SwiftUI

struct AddNoteView: View {

    @ObservedObject var jvm: JournalViewModel
    @EnvironmentObject var navManager: NavigationManager
    
    @State var note = ""
    
    var body: some View {
       
        VStack(alignment: .leading, spacing: 8){
            
            Text("Add your note")
                .font(.title)
                .fontWeight(.semibold)
                .padding(.bottom)
            
            
            Divider()
                .frame(height: 2)
                .overlay(.white)
            
            Spacer()
            
            Text("A little speech about your sleep")
            TextField("Note", text: $note, axis: .vertical)
                .lineLimit(3, reservesSpace: true)
                .textFieldStyle(.roundedBorder)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke()
                    
                )
            
            HStack(){
                Button{
                    if let index = jvm.entries.indices.last {
                        jvm.entries[index].note = note
                        print(jvm.entries[index])
                        navManager.path.removeLast(navManager.path.count)
                    }
                }
                
                label: {
                    Text("Submit Entry")
                        .padding()
                }
                .foregroundColor(.black)
                .background(!note.isEmpty ? .white : .gray)
                .cornerRadius(9)
                .disabled(note.isEmpty)
            }
            .padding(.top, 16)
            .frame(maxWidth: .infinity, alignment: .center)
            
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    AddNoteView(jvm: JournalViewModel())
}
