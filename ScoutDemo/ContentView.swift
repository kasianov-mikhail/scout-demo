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
