//
//  EntryCardDetail.swift
//  PJ
//
//  Created by Santo De La Riva on 19/02/25.
//

import SwiftUI

struct EntryCardDetail: View {
    
    var title: String = "Sleep"
    var metric:  Double = 10.2
    
    var type: String {
        if title == "Sleep"{
            return "h"}
        else if title == "Matress"{
            return "min"
        }
        else{
            return ""
        }
    }
    
    var percentage: Double = 27.5
    var op: String {
        if percentage > 0 {
            return "+"
        } else {
            return ""
        }
    }
    
    var body: some View {
        
        VStack(spacing: 4) {
            Text(title)
                .fontWeight(.bold)
            
            Text("\(metric, specifier: "%.1f")\(type)")
                
            
            Text("\(op)\(percentage, specifier: "%.1f")%")
                .foregroundStyle(percentage > 0  ? Color(.myGreen) : Color(.myRed))
            .fontWeight(.heavy)        }
        
    }
}

#Preview {
    EntryCardDetail()
}
