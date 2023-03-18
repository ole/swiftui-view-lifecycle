import SwiftUI

/// A view that records and displays its lifecycle events.
struct LifecycleMonitor: View {
    var label: String
    @State private var stateTimestamp: Date = .now
    @State private var onAppearTimestamp: Date? = nil
    @State private var taskStartTimestamp: Date? = nil
    @State private var onDisappearTimestamp: Date? = nil
    @State private var color: Color = .random()

    var body: some View {
        VStack(spacing: 16) {
            Text(label)
                .font(.title3)
            Grid(horizontalSpacing: 16) {
                GridRow(alignment: .firstTextBaseline) {
                    Text("@State")
                        .gridColumnAlignment(.leading)
                    Text("\(stateTimestamp, style: .timer) ago")
                        .monospacedDigit()
                        .gridColumnAlignment(.leading)
                }
                .help("When the state (incl. @State and @StateObject) for this view was created")

                GridRow(alignment: .firstTextBaseline) {
                    Text("onAppear")
                    Text(timestampLabel(for: onAppearTimestamp))
                        .monospacedDigit()
                }
                .help("When onAppear was last called for this view")

                GridRow(alignment: .firstTextBaseline) {
                    Text("onDisappear")
                    Text(timestampLabel(for: onDisappearTimestamp))
                        .monospacedDigit()
                }
                .help("When onDisappear was last called for this view")

                GridRow(alignment: .firstTextBaseline) {
                    Text("task")
                    Text(timestampLabel(for: taskStartTimestamp))
                        .monospacedDigit()
                }
                .help("When task was last called for this view")

            }
            .font(.callout)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background {
            RoundedRectangle(cornerRadius: 16)
                .fill(color)
        }
        .onAppear {
            let timestamp = Date.now
            print("\(timestamp) \(label): onAppear")
            let animation: Animation? = onAppearTimestamp == nil ? nil : .easeOut(duration: 1)
            withAnimation(animation) {
                onAppearTimestamp = timestamp
            }
        }
        .onDisappear {
            let timestamp = Date.now
            print("\(timestamp) \(label): onDisappear")
            let animation: Animation? = onDisappearTimestamp == nil ? nil : .easeOut(duration: 1)
            withAnimation(animation) {
                onDisappearTimestamp = timestamp
            }
        }
        .task {
            let timestamp = Date.now
            print("\(timestamp) \(label): task started")
            let animation: Animation? = taskStartTimestamp == nil ? nil : .easeOut(duration: 1)
            withAnimation(animation) {
                taskStartTimestamp = timestamp
            }
        }
    }

    private func timestampLabel(for timestamp: Date?) -> LocalizedStringKey {
        if let t = timestamp {
            return "\(t, style: .timer) ago"
        } else {
            return "never"
        }
    }
}

struct LifecycleMonitor_Previews: PreviewProvider {
    static var previews: some View {
        List {
            ForEach(1..<100) { i in
                LifecycleMonitor(label: "\(i)")
            }
        }
    }
}

extension Color {
    static func random() -> Self {
        Color(
            red: .random(in: 0.5...0.9),
            green: .random(in: 0.5...0.9),
            blue: .random(in: 0.5...0.9)
        )
    }
}
