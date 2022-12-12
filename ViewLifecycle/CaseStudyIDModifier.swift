import SwiftUI

struct CaseStudyIDModifier: View {
    @State private var generation: Int = 0

    var body: some View {
        VStack {
            Button("Increment view ID") {
                generation &+= 1
            }
            .buttonStyle(.bordered)

            LifecycleMonitor(label: ".id(\(generation))")
                .id(generation)

            Text("`.id(_:)` resets the view identity (and hence the view’s state) whenever the argument changes. It’s as if an entirely new view is created.")
                .font(.caption)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
        .navigationTitle(".id(_:)")
    }
}

struct CaseStudyIDModifier_Previews: PreviewProvider {
    static var previews: some View {
        CaseStudyIDModifier()
    }
}
