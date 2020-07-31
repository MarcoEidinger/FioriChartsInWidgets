//
//  ChartWidget.swift
//  ChartWidget
//
//  Created by Eidinger, Marco on 7/31/20.
//

import WidgetKit
import SwiftUI
import FioriCharts

struct Provider: TimelineProvider {
    public typealias Entry = SimpleEntry

    public func snapshot(with context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }

    public func timeline(with context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        let timeline = Timeline(entries: [SimpleEntry(date: Date())], policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    public let date: Date
}

struct PlaceholderView : View {
    var body: some View {
        Text("Placeholder View")
    }
}

struct ChartWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack {
            VStack {
                Text("Does not work")
                ChartView(ChartModel(chartType: .line, data: [[200, 170, 165, 143, 166, 112, 110], [150, 120, 130, 135, 120, 138, 137]], titlesForCategory: [["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul"]]))
            }
            VStack {
                Text("Works")
                ChartView(ChartModel(chartType: .micro_bullet, data: [[35, 50, 70], [0, 20, 50, 100]], colorsForCategory: [0: [0: .preferredColor(.chart1), 1: .preferredColor(.chart2), 2: .preferredColor(.chart2), 3: .preferredColor(.chart3)]]))
            }
        }

    }
}

@main
struct ChartWidget: Widget {
    private let kind: String = "ChartWidget"

    public var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider(), placeholder: PlaceholderView()) { entry in
            ChartWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct ChartWidget_Previews: PreviewProvider {
    static var previews: some View {
        ChartWidgetEntryView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemLarge))

        ChartWidgetEntryView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemMedium))

        ChartWidgetEntryView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
