//
// Copyright 2026 Mikhail Kasianov
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import DemoConnector
import Scout
import ScoutUI
import SwiftUI

@main struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    @State private var isPresented = false

    var body: some View {
        Button("Open Scout") {
            isPresented = true
        }
        .scoutHome(isPresented: $isPresented, backends: [.demo()])
    }
}

#Preview {
    ContentView()
}
