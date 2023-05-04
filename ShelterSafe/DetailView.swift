import SwiftUI

struct Shelter: Identifiable {
    var id = UUID()
    var name: String
    var location: String
    var contact: String
    var type: String
    var capacity: Int
}

class ShelterStore: ObservableObject {
    @Published var shelters = [Shelter]()
    
    func addShelter(shelter: Shelter) {
        shelters.append(shelter)
    }
}

struct CreateShelterView: View {
    @State var name = ""
    @State var location = ""
    @State var contact = ""
    @State var type = ""
    @State var capacity = ""
    @ObservedObject var shelterStore: ShelterStore
    
    var body: some View {
        Form {
            Section(header: Text("Shelter Info")) {
                TextField("Name", text: $name)
                TextField("Location", text: $location)
                TextField("Contact", text: $contact)
                TextField("Type", text: $type)
                TextField("Capacity", text: $capacity)
                    .keyboardType(.numberPad)
            }
            
            Section {
                Button(action: {
                    guard let capacityInt = Int(self.capacity) else { return }
                    let shelter = Shelter(name: self.name, location: self.location, contact: self.contact, type: self.type, capacity: capacityInt)
                    self.shelterStore.addShelter(shelter: shelter)
                }) {
                    Text("Create Shelter")
                }
            }
        }
        .navigationBarTitle("Create Shelter")
    }
}

struct ShelterListView: View {
    @ObservedObject var shelterStore: ShelterStore
    
    var body: some View {
        List(shelterStore.shelters) { shelter in
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
    @StateObject var shelterStore = ShelterStore()
    @State private var showingCreateShelterView = false
    
    var body: some View {
        NavigationView {
            VStack {
                Button(action: {
                    self.showingCreateShelterView = true
                }) {
                    Text("Create Shelter")
                }
                
                NavigationLink(destination: ShelterListView(shelterStore: shelterStore)) {
                    Text("View Shelters")
                }
            }
            .sheet(isPresented: $showingCreateShelterView) {
                CreateShelterView(shelterStore: shelterStore)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
