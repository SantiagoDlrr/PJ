//
//  lineChart.swift
//  PJ
//
//  Created by Santo De La Riva on 18/01/25.
//

import SwiftUI
import Charts
//swwift ui line graph

struct LineChartView: View {
    
    let data: [LineChartData]
    
    var body: some View {
        VStack(alignment: .leading){
            Text("January Scores")
                .font(.system(size: 16, weight: .medium))
            
            Chart {
                ForEach(data, id: \.id){ item in
                    // LineMark view will make a line for every point and those lines will connect and create a line chart.
                    LineMark(
                        x: .value("Weekday", item.date),
                        y: .value("Count", item.value)
                    ) // OPTIONAL: Puedes hacer que esto sea una struct
                    .foregroundStyle(item.type.color)
                    .interpolationMethod(.catmullRom)
                    .lineStyle(.init(lineWidth: 2))
                    .shadow(radius: 1)
                    .symbol{
                        Circle()
                            .fill(item.type.color)
                            .frame(width: 12, height: 12)
                            .overlay {
                                Text("\(Int(item.value))")
                                    .foregroundStyle(.white)
                                    .frame(width: 20)
                                    .font(.system(size: 10, weight: .medium))
                                    .offset(y: -15)
                                    
                            }
                            
                    }
                }
            }
            .chartXAxis {
                AxisMarks(preset: .extended, values: .stride (by: .month)) { value in
                    AxisValueLabel(format: .dateTime.month())
                }
            }
            .chartYAxis {
                AxisMarks(preset: .extended, values: .stride(by: 1.5))
            }
        }
        .frame(height: 300)
    }
}
