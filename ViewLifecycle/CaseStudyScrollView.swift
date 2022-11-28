import SwiftUI

struct CaseStudyScrollView: View {
    var body: some View {
        ScrollView {
            OnAppearMonitor(label: "ScrollView top")

            VStack {
                Image(systemName: "arrow.down.circle.fill")
                Text("Scroll down")
            }
            .font(.largeTitle)
            .padding(.top, 50)

            Spacer(minLength: 2000)

            OnAppearMonitor(label: "ScrollView bottom")
        }
        .navigationTitle("ScrollView")
    }
}

struct CaseStudyScrollView_Previews: PreviewProvider {
    static var previews: some View {
        CaseStudyScrollView()
    }
}
