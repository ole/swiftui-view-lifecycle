import SwiftUI

struct MyView: View {
    var body: some View {
        Capsule()
            .fill(.green)
            .frame(height: 80)
            .onAppear {
                print("MyView onAppear")
            }
            .onDisappear {
                print("MyView onDisappear")
            }
    }
}

struct ContentView: View {
    var body: some View {
        ScrollView {
            MyView()
            Spacer(minLength: 1000)
            Rectangle()
                .fill(.yellow)
                .frame(height: 80)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
