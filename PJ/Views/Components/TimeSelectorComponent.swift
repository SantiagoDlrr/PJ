//
//  TimeSelectorComponent.swift
//  PJ
//
//  Created by Santo De La Riva on 21/01/25.
//
import SwiftUI

struct TimeSelectorComponent: View {
    let time: String
    var body: some View {
        ZStack{
            
            Circle()
                .frame(height: 45)

            Text(time)
                .foregroundStyle(.black)
                .fontWeight(.bold)
                .font(.title2)
        }
    }
}

