# Scout Demo

A minimal iOS app that opens the [Scout](https://github.com/kasianov-mikhail/scout) dashboard against a
self-contained demo backend. Nothing touches the network or iCloud: `Backend.demo()` answers every query
from an in-memory corpus of fabricated events, metrics, crashes, and activity, so the dashboard is fully
populated for previews, screenshots, and App Store demos.

## Requirements

- iOS 26.0+ (iPhone, portrait only)
- Xcode 26+

## Running

```sh
open ScoutDemo.xcodeproj
```

The `scout` package is fetched automatically as a remote dependency (`main` branch). Build and run, then
tap **Open Scout** to present the dashboard.

## How it works

```swift
import DemoConnector
import ScoutUI

struct ContentView: View {
    @State private var isPresented = false

    var body: some View {
        Button("Open Scout") { isPresented = true }
            .scoutHome(isPresented: $isPresented, backends: [.demo()])
    }
}
```

## Related

- [scout](https://github.com/kasianov-mikhail/scout) — the logging and analytics framework
- [scout-ip](https://github.com/kasianov-mikhail/scout-ip) — a companion app that generates real data
