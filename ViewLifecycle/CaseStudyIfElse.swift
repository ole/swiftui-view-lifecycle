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
            Text("Toggling the switch toggles between the true and false branches of an `if`/`else` statement. Observe that the view is destroyed on every toggle.")
                .font(.callout)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
        .navigationTitle("if/else")
    }
}

struct CaseStudyIfElse_Previews: PreviewProvider {
    static var previews: some View {
        CaseStudyIfElse()
    }
}
