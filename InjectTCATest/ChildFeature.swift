import ComposableArchitecture
import SwiftUI

#if DEBUG
  import Inject
#endif

@Reducer public struct ChildFeature {
  public init() {}

  @ObservableState public struct State: Equatable {}

  public enum Action { case noop }

  public var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      case .noop: return .none
      }
    }
  }
}

public struct ChildView: View {
  let store: StoreOf<ChildFeature>

  public init(store: StoreOf<ChildFeature>) { self.store = store }

  public var body: some View { VStack { Text("ChildFeature") }.enableInjection() }

  #if DEBUG
    @ObserveInjection var inject
  #endif
}
