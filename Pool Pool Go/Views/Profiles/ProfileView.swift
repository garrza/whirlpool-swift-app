//
//  ProfileSummary.swift
//  Pool Pool Go
//
//  Created by ramiro garza on 4/3/24.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        if let firstProfile = modelData.activeProfile {
            ScrollView {
                VStack {
                    HStack{
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.gray)
                        
                        VStack(alignment: .leading) {
                            Text("\(firstProfile.firstName) \(firstProfile.lastName)")
                                .font(.headline)
                            Text("\(firstProfile.email)")
                                .font(.subheadline)
                        }
                        Spacer()
                    }
                    .padding()
                    
                    Divider()
                    
                    HStack {
                        PointsCard()
                        ReportsCard()
                    }
                    .padding()
                    
                    Divider()
                    
                    VStack(alignment: .leading) {
                        HStack(alignment: .center) {
                            Text("Líderes Whirlpool")
                                .font(.largeTitle)
                                .bold()
                                .foregroundColor(.black)
                            
                            Image(systemName: "trophy.fill")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundColor(.yellow)
                        }
                        
                    }
                    .padding()
                }
                LeaderboardView()
            }
        } else {
            Text("Error retriving profile")
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(ModelData())
    }
}
