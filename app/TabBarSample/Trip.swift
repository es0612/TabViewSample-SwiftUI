import Foundation

struct Trip: Identifiable, Hashable {
    
    var id = UUID().uuidString
    var image: String
    var title: String
}


var trips = [
    Trip(image: "1", title: "1"),
    Trip(image: "2", title: "2"),
    Trip(image: "3", title: "3")
]
