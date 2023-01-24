//
//  DetailView.swift
//  ShelterSafe
//
//  Created by Onik Houqe on 11/29/22.
//

import SwiftUI

struct DetailView: View {
    
    @State var results = [TaskEntry]()
    let URL = "https://api.weather.gov/alerts/active?point="
    
  
    
    var body: some View {
        
        
        
        VStack {
            ZStack {
                Rectangle().ignoresSafeArea()
                    .foregroundColor(.blue)
                    .frame(height: 100)
                    
                HStack {
                    VStack {
                        Text("Disaster Status")
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding(.leading, 15.0)
                            .offset(x: 0, y: 20)
                        
                    }
                    Spacer()
                }
            }
            
            List(results, id: \.id) { item in
                      VStack(alignment: .leading) {
                          Text(item.title)
                      }
                  }.onAppear(perform: loadData)
            
            Spacer()
            
        }
        
        
    }
    
    func loadData() {
        guard let url = Foundation.URL(string: "https://jsonplaceholder.typicode.com/todos") else {
              print("Your API end point is Invalid")
              return
          }
          let request = URLRequest(url: url)

          URLSession.shared.dataTask(with: request) { data, response, error in
              if let data = data {
                  if let response = try? JSONDecoder().decode([TaskEntry].self, from: data) {
                      DispatchQueue.main.async {
                          self.results = response
                      }
                      return
                  }
              }
          }.resume()
      }
    
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
