import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            OnAppearMonitor(label: "top")
            Spacer(minLength: 2000)
            OnAppearMonitor(label: "bottom")
        }
        .foregroundStyle(.green)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
