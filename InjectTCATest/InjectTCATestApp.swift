import ComposableArchitecture
import SwiftUI

@main struct InjectTCATestApp: App {
  let store = Store.init(initialState: .init(childState: .init()), reducer: { AppFeature() })

  var body: some Scene { WindowGroup { AppView(store: self.store) } }
}
