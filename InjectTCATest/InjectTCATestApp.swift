import ComposableArchitecture
import HotSwiftUI
import SwiftUI

@main
struct InjectTCATestApp: App {
  let store = Store(initialState: .init(childState: .init()), reducer: { AppFeature() })

  var body: some Scene {
    WindowGroup {
      AppView(store: store).enableInjection()
    }
  }

  @ObserveInjection
  var forceRedraw
}
