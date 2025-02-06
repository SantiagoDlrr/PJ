//
//  LineChartData.swift
//  PJ
//
//  Created by Santo De La Riva on 21/01/25.
//

// Used to plot graph lines
import Foundation
import Charts
import SwiftUICore

struct LineChartData {
    var id =  UUID()
    var date = Date()
    var value: Double
    
    var type: LineChartType
}

// Design multiple lines on the graph
enum LineChartType: String, CaseIterable, Plottable {
    case optimal = "Optimal"
    case outside = "Outside Range"
    
    var color: Color {
        switch self{
        case .optimal: return.green
        case .outside: return.indigo
        }
    }
}

// Adding for add components to the Date
// StartOfDay for getting the start time of the day
extension Date{
    func adding(_ component: Calendar.Component, value: Int, using calendar: Calendar = .current) -> Date? {
        return calendar.date(byAdding: component, value: value, to: self)
    }
    
    var startOfDay: Date {
        return Calendar.current.startOfDay(for: self)
    }
}

