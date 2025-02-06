//
//  CustomTabView.swift
//  PJ
//
//  Created by Santo De La Riva on 20/01/25.
//

import SwiftUI

struct CustomTabView: View {
    @Binding var selectedIndex: Int
    @Namespace private var animationNamespace
    
    let tabBarItems: [(image: String, title:  String)]  = [
        ("bed.double.fill", "Sleep"),
        ("book.fill", "Journal"),
        ("powersleep", "Calculator"),
    ]
    
    var body: some View {
        ZStack {
            Capsule()
                .frame(height: 80)
                .foregroundColor(Color(.secondarySystemBackground))
                .shadow(radius: 2)
            
            HStack{
                ForEach(0..<3) { index in
                    Button{
                        withAnimation{
                            selectedIndex = index + 1
                        }
                    } label: {
                        VStack(spacing: 8){
                            Spacer()
                            
                            Image(systemName: tabBarItems[index].image)
                            
                            Text(tabBarItems[index].title)
                            
                            if index + 1 == selectedIndex{
                                Capsule()
                                    .frame(height: 8)
                                    .foregroundColor(.blue)
                                    .matchedGeometryEffect(id: "SelectedTabId", in: animationNamespace)
                                    .offset(y: 3)
                            } else {
                                Capsule()
                                    .frame(height: 8)
                                    .foregroundColor(.clear)
                                    .offset(y: 3)
                            }
                            
                        }
                        .foregroundColor(index + 1 == selectedIndex ? .blue : .gray)
                    }
                    
                }
            }
            .frame(height: 80)
            .clipShape(Capsule())
            
            
            
        }
        .padding(.horizontal)
    
    }
}

#Preview (traits: .sizeThatFitsLayout) {
    CustomTabView(selectedIndex: .constant(2))
        .padding(.vertical)
}
