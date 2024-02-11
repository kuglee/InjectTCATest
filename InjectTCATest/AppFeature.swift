import ComposableArchitecture
import SwiftUI

@Reducer public struct AppFeature {
  public init() {}

  @ObservableState public struct State: Equatable {
    var childState: ChildFeature.State
    public init(childState: ChildFeature.State) { self.childState = childState }
  }

  public enum Action { case childAction(ChildFeature.Action) }

  public var body: some ReducerOf<Self> {
    Scope(state: \.childState, action: \.childAction) { ChildFeature() }

    Reduce { state, action in
      switch action {
      case .childAction: return .none
      }
    }
  }
}

public struct AppView: View {
  @Bindable var store: StoreOf<AppFeature>

  public init(store: StoreOf<AppFeature>) { self.store = store }

  public var body: some View {
    VStack {
      Text("AppFeature")
      ChildView(store: self.store.scope(state: \.childState, action: \.childAction))
    }
  }

  #if DEBUG
    @ObserveInjection var inject
  #endif
}
