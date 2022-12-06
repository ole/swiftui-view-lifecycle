import SwiftUI

/// A view that records and displays its lifecycle events.
struct LifecycleMonitor: View {
    var label: String
    @State private var stateTimestamp: Date = .now
    @State private var onAppearTimestamp: Date? = nil
    @State private var onDisappearTimestamp: Date? = nil
    @State private var color: Color = .random()

    var body: some View {
        VStack(spacing: 16) {
            Text(label)
                .font(.title3)
            Grid(horizontalSpacing: 16) {
                GridRow {
                    Text("@State")
                        .gridColumnAlignment(.leading)
                    Text("\(stateTimestamp, style: .timer) ago")
                        .monospacedDigit()
                        .gridColumnAlignment(.leading)
                }
                GridRow {
                    Text("onAppear")
                    Text(timestampLabel(for: onAppearTimestamp))
                        .opacity(onAppearTimestamp == nil ? 0 : 1)
                        .monospacedDigit()
                        .animation(.easeOut(duration: 1), value: onAppearTimestamp)
                }
                GridRow {
                    Text("onDisappear")
                    Text(timestampLabel(for: onDisappearTimestamp))
                        .monospacedDigit()
                        .animation(.easeOut(duration: 1), value: onDisappearTimestamp)
                }
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
            onAppearTimestamp = timestamp
        }
        .onDisappear {
            let timestamp = Date.now
            print("\(timestamp) \(label): onDisappear")
            onDisappearTimestamp = timestamp
        }
    }

    private func timestampLabel(for timestamp: Date?) -> LocalizedStringKey {
        if let t = timestamp {
            return "\(t, style: .timer) ago"
        } else {
            return "not yet"
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
