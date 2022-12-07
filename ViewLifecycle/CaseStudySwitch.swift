import SwiftUI

enum Cases {
    case one
    case two
    case three
}

struct CaseStudySwitch: View {
    @State private var state: Cases = .one

    var body: some View {
        VStack {
            Picker("Selection", selection: $state) {
                Text("One").tag(Cases.one)
                Text("Two").tag(Cases.two)
                Text("Three").tag(Cases.three)
            }
            .pickerStyle(.segmented)

            switch state {
            case .one:
                LifecycleMonitor(label: "One")
            case .two:
                LifecycleMonitor(label: "Two")
            case .three:
                LifecycleMonitor(label: "Three")
            }

            Text("A `switch` statement behaves like a series of `if`/`else` branches. Content views are fully destroyed and recreated as you switch between states.")
                .font(.callout)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
        .navigationTitle("switch")
    }
}

struct CaseStudySwitch_Previews: PreviewProvider {
    static var previews: some View {
        CaseStudySwitch()
    }
}
