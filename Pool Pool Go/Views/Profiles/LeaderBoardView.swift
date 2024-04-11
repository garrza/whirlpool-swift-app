//
//  LeaderBoardView.swift
//  Pool Pool Go
//
//  Created by ramiro garza on 4/3/24.
//

import SwiftUI

struct LeaderboardView: View {
    @EnvironmentObject var modelData: ModelData
    
    var sortedUsers: [Profile] {
        modelData.profiles.sorted(by: { $0.points > $1.points })
    }
    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(sortedUsers.indices, id: \.self) { index in
                    let profile = sortedUsers[index]
                    LeaderboardRow(position: index + 1, profile: profile)
                }
            }
            .scrollContentBackground(.hidden)
        } detail: {
            Text("Select a landmark")
        }
    }
    
    struct LeaderboardRow: View {
        var position: Int
        var profile: Profile
        
        var body: some View {
            HStack {
                Text("\(position) .")
                    .bold()
                Text("\(profile.firstName) \(profile.lastName)")
                Spacer()
                VStack(alignment: .leading, content: {
                    Text("Reportes:")
                    Text("\(profile.reports)")
                })
                VStack(alignment: .leading, content: {
                    Text("Puntos: ")
                    Text("\(profile.points)")
                        .bold()
                        .foregroundColor(.blue)
                })
            }
        }
    }
    
    struct LeaderboardView_Previews: PreviewProvider {
        static var previews: some View {
            LeaderboardView()
                .environmentObject(ModelData())
        }
    }
}
