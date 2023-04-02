//
//  HomePageView.swift
//  ShelterSafe
//
//  Created by Zoe Yau on 4/2/23.
//

import SwiftUI

struct HomePageView: View {
    var body: some View {
        VStack{
            Text("Home Page")
                .font(.system(size: 30))
                .fontWeight(.bold)
                .frame(height: 100, alignment: .top)
            Text("Welcome to ShelterSafe. Please click on the tabs below to navigate the app and find a safe sheter that's suitable for you.")
                .font(.system(size: 20))
                .multilineTextAlignment(.center)
                .frame(alignment: .leading)
            Text("FAQ")
                .font(.system(size: 30))
                .fontWeight(.bold)
                .frame(height: 100)
            
            
            
        }
    }

}


struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
