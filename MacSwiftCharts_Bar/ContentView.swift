//
//  ContentView.swift
//  MacSwiftCharts_Bar
//
//  Created by rabbit on 2025/05/10.
//

import SwiftUI
import Charts


// MARK: - Swift Chart View

struct ChartData: Identifiable {
    var id = UUID()
    let category: String
    let value: Int
}

struct ContentView: View {

    @ObservedObject var viewModel: ContentViewModel

    var body: some View {
        Chart {
            RuleMark( y: .value("warning", 300) )
                .foregroundStyle(.red)
                .lineStyle(.init(lineWidth: 5))

            ForEach(viewModel.data) { data in
                BarMark(
                    x: .value("category", data.category),
                    y: .value("value", data.value),
                    width: .ratio(0.6)
                )
                .foregroundStyle(.green)
                .opacity(0.5)
                .annotation(position: .top, alignment: .center, spacing: 5) { annotationContext in
                    Text("\(data.value)")
                        .font(.caption)
                }
            }
        }
        .chartYAxis {
            AxisMarks(preset: .automatic, position: .leading, values: .automatic) { axisValue in
                AxisGridLine(stroke: StrokeStyle(lineWidth: 2, dash: [3,2,3,2]))
                    .foregroundStyle(.gray)
                AxisTick()
                AxisValueLabel()
            }
            AxisMarks(preset: .automatic, position: .trailing, values: [500]) { axisValue in
                AxisGridLine(stroke: StrokeStyle(lineWidth: 5))
                    .foregroundStyle(.blue)
                AxisTick()
                AxisValueLabel()
                    .foregroundStyle(.blue)
            }
        }
        .chartXAxisLabel(position: .bottom, alignment: .center, spacing: 10) {
            Text("Name")
                .font(.title2)
        }
        .chartYAxisLabel(position: .leading, alignment: .center, spacing: 10) {
            Text("Count")
                .font(.title2)
                // About Rotation : https://stackoverflow.com/questions/74663985/rotate-axis-label-in-swift-charts
                .rotationEffect(.degrees(180), anchor: .top)
                .frame(minWidth: 55, minHeight: 50)
        }

        // for design on prewiew window
        // .frame(maxWidth: 500)
    }

}

class ContentViewModel: ObservableObject {

    @Published var data: [ChartData] = []

    init(_ chartData: [ChartData] = []) {
        self.data = chartData
    }
}




// MARK: - Preview

#Preview("Swift Charts - Bar") {
    ContentView(viewModel: ContentViewModel(
        [
            .init(category: "A", value: 100),
            .init(category: "B", value: 200),
            .init(category: "C", value: 300),
            .init(category: "D", value: 500),
            .init(category: "E", value: 400),
        ]
    ))
}

