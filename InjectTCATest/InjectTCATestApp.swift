import ComposableArchitecture
import SwiftUI

#if DEBUG
  import Inject
#endif

@main struct InjectTCATestApp: App {
  let store = Store.init(initialState: .init(childState: .init()), reducer: { AppFeature() })

  var body: some Scene { WindowGroup { AppView(store: self.store).enableInjection() } }

  #if DEBUG
    @ObserveInjection var redraw
  #endif
}
