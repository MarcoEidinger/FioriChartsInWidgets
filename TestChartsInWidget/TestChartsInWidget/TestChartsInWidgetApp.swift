//
//  TestChartsInWidgetApp.swift
//  TestChartsInWidget
//
//  Created by Eidinger, Marco on 7/31/20.
//

import SwiftUI

@main
struct TestChartsInWidgetApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    var body: some View {
        Text("Check the widget and not the app :)")
    }
}

struct ChartWidgetApp_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
