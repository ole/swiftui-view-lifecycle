import SwiftUI

struct OnAppearMonitor: View {
    var label: String
    @State private var stateTimestamp: Date = Date.now
    @State private var onAppearTimestamp: Date? = nil
    @State private var onDisappearTimestamp: Date? = nil
    @State private var color: Color = .random()

    var body: some View {
        Grid {
            Text(label)
            GridRow {
                Text("State reset")
                    .gridColumnAlignment(.leading)
                Text("\(stateTimestamp, style: .timer) ago")
                    .monospacedDigit()
                    .bold()
                    .gridColumnAlignment(.leading)
            }
            GridRow {
                Text("onAppear")
                if let t = onAppearTimestamp {
                    Text("\(t, style: .timer) ago")
                        .monospacedDigit()
                        .bold()
                }
            }
            GridRow {
                Text("onDisappear")
                let text: LocalizedStringKey = {
                    if let t = onDisappearTimestamp {
                        return "\(t, style: .timer) ago"
                    } else {
                        return "never"
                    }
                }()
                Text(text)
                        .monospacedDigit()
                        .bold()
            }
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
            withAnimation(.easeOut(duration: 1)) {
                onAppearTimestamp = timestamp
            }
        }
        .onDisappear {
            let timestamp = Date.now
            print("\(timestamp) \(label): onDisappear")
            withAnimation(.easeOut(duration: 1)) {
                onDisappearTimestamp = timestamp
            }
        }
    }
}

struct OnAppearMonitor_Previews: PreviewProvider {
    static var previews: some View {
        List {
            ForEach(1..<100) { i in
                OnAppearMonitor(label: "\(i)")
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
