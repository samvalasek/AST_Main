//
//  BarChart.swift
//  AST_Main
//
//  Created by Sam Valasek on 03/12/2023.
//

import SwiftUI
import Charts

struct BarChart: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Your Studying")
                .font(.title2)
                .fontWeight(.semibold)
            Chart {
                BarMark(x: .value("Date", "01/12"), y: .value("Time", 40))
                    .opacity(0.4)
                BarMark(x: .value("Date", "02/12"), y: .value("Time", 32))
                    .opacity(0.32)
                BarMark(x: .value("Date", "03/12"), y: .value("Time", 47))
                    .opacity(0.47)
                BarMark(x: .value("Date", "04/12"), y: .value("Time", 20))
                    .opacity(0.2)
                BarMark(x: .value("Date", "05/12"), y: .value("Time", 110))
                BarMark(x: .value("Date", "06/12"), y: .value("Time", 30))
                    .opacity(0.3)
                BarMark(x: .value("Date", "07/12"), y: .value("Time", 6))
                    .opacity(0.2)
            }
            .aspectRatio(1, contentMode: .fit)
        }
        .padding()
    }
}

#Preview {
    BarChart()
}
