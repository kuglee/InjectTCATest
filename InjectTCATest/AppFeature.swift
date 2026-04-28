import ComposableArchitecture
import HotSwiftUI
import SwiftUI

@Reducer
public struct AppFeature {
  public init() {}

  @ObservableState
  public struct State: Equatable {
    var childState: ChildFeature.State
    var count = 0

    public init(childState: ChildFeature.State) {
      self.childState = childState
    }
  }

  public enum Action {
    case childAction(ChildFeature.Action)
    case incrementButtonTapped
  }

  public var body: some ReducerOf<Self> {
    Scope(state: \.childState, action: \.childAction) {
      ChildFeature()
    }

    Reduce { state, action in
      switch action {
      case .childAction: return .none
      case .incrementButtonTapped:
        state.count += 1

        return .none
      }
    }
  }
}

public struct AppView: View {
  @Bindable
  var store: StoreOf<AppFeature>

  public init(store: StoreOf<AppFeature>) {
    self.store = store
  }

  public var body: some View {
    VStack {
      Text("AppFeature")
      Button("Increment") {
        store.send(.incrementButtonTapped)
      }
      Text("Count: \(store.count)")
      ChildView(store: store.scope(state: \.childState, action: \.childAction))
    }
    .enableInjection()
  }

  @ObserveInjection
  var forceRedraw
}
