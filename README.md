# Scout Demo

[![Build](https://github.com/kasianov-mikhail/scout-demo/actions/workflows/build.yml/badge.svg)](https://github.com/kasianov-mikhail/scout-demo/actions/workflows/build.yml) [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE) ![Platform](https://img.shields.io/badge/platform-iOS%2026%2B-blue) ![Swift](https://img.shields.io/badge/Swift-6.0-orange)

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

## Workspace (optional)

`ScoutDemo.xcworkspace` also surfaces the source of the [`scout`](https://github.com/kasianov-mikhail/scout)
and [`scout-db`](https://github.com/kasianov-mikhail/scout-db) packages so you can edit them alongside the
app. They live as sibling folders next to `scout-demo`; run the bootstrap script to clone any that are
missing:

```sh
./bootstrap.sh
```

Then open `ScoutDemo.xcworkspace` instead of the project. With `scout` checked out locally, Xcode builds
against your local copy instead of the remote dependency.

## Related

- [scout](https://github.com/kasianov-mikhail/scout) — the logging and analytics framework
- [scout-ip](https://github.com/kasianov-mikhail/scout-ip) — a companion app that generates real data

## License

Released under the MIT License. See [LICENSE](LICENSE) for details.
