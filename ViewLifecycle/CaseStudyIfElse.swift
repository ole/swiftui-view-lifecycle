import SwiftUI

struct CaseStudyIfElse: View {
    @State private var flag: Bool = true

    var body: some View {
        VStack {
            Toggle(isOn: $flag) {
                Text("if/else toggle")
            }
            if flag {
                LifecycleMonitor(label: "on")
            } else {
                LifecycleMonitor(label: "off")
            }
            Text(explanation)
                .font(.callout)
        }
        .padding()
        .navigationTitle("if/else")
    }

    private var explanation: LocalizedStringKey {
        "Toggling the switch toggles between the true and false branches of an `if`/`else` condition. Observe that the view is destroyed on every toggle."
    }
}

struct CaseStudyIfElse_Previews: PreviewProvider {
    static var previews: some View {
        CaseStudyIfElse()
    }
}
