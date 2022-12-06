import SwiftUI

struct CaseStudyScrollViewVStackForEach: View {
    @State private var items: [Item] = sampleItems

    var body: some View {
        ScrollView {
            VStack {
                ForEach(items) { item in
                    HStack {
                        let label = String(item.id.uuidString.prefix(8))
                        LifecycleMonitor(label: label)
                        Button(role: .destructive) {
                            if let idx = items.firstIndex(where: { $0.id == item.id }) {
                                items.remove(at: idx)
                            }
                        } label: {
                            Label("Delete", systemImage: "minus.circle")
                        }
                    }
                    .padding()
                }
            }
        }
        .navigationTitle("ScrollView > VStack > ForEach")
        .toolbar {
            ToolbarItem {
                Button("Prepend") {
                    let newItem = Item(id: UUID())
                    items.insert(newItem, at: 0)
                }
            }
            ToolbarItem {
                Button("Append") {
                    let newItem = Item(id: UUID())
                    items.append(newItem)
                }
            }
        }
        .animation(.default, value: items)
    }
}

struct CaseStudyScrollViewVStackForEach_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CaseStudyScrollViewVStackForEach()
        }
    }
}
