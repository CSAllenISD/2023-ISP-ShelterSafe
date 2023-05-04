import SwiftUI

struct Shelter: Identifiable {
    var id = UUID()
    var name: String
    var location: String
    var contact: String
    var type: String
    var capacity: Int
}

struct ShelterListView: View {
    let shelters = [
        Shelter(name: "Shelter A", location: "Location A", contact: "Contact A", type: "Type A", capacity: 20),
        Shelter(name: "Shelter B", location: "Location B", contact: "Contact B", type: "Type B", capacity: 30),
        Shelter(name: "Shelter C", location: "Location C", contact: "Contact C", type: "Type C", capacity: 40)
    ]
    
    var body: some View {
        List(shelters) { shelter in
            VStack(alignment: .leading) {
                Text(shelter.name)
                Text(shelter.location)
                    .font(.caption)
            }
        }
        .navigationBarTitle("Shelters")
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            ShelterListView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
