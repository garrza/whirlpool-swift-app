//
//  ProfileSummary.swift
//  Pool Pool Go
//
//  Created by ramiro garza on 4/3/24.
//

import SwiftUI

struct ProfileView: View {
    let profile: Profile
    
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        ScrollView {
            VStack {
                HStack{
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.gray)
                    
                    VStack(alignment: .leading) {
                        Text("\(profile.firstName) \(profile.lastName)")
                            .font(.headline)
                        Text("\(profile.email)")
                            .font(.subheadline)
                    }
                    Spacer()
                }
                .padding()
                
                Divider()
                
                HStack {
                    PointsCard(profile: profile)
                    ReportsCard(profile: profile)
                }
                .padding()
                
                Divider()
                
                VStack(alignment: .leading) {
                    HStack(alignment: .center) {
                        Text("Líderes Whirpool")
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.black)
                        
                        Image(systemName: "trophy.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.yellow)
                    }
                    
                    LeaderboardView()
                }
                .padding()
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(profile: Profile.default)
            .environmentObject(ModelData())
    }
}
