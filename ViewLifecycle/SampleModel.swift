import Foundation

let sampleItems: [Item] = (1...40).map { _ in
    Item(id: UUID())
}

struct Item: Hashable, Identifiable {
    var id: UUID
}
