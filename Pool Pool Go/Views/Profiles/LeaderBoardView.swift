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
        let sorted = modelData.profiles.sorted { profile1, profile2 in
                let points1 = profile1.points ?? 0
                let points2 = profile2.points ?? 0
                if points1 == points2 {
                    return profile1.firstName < profile2.firstName
                } else {
                    return points1 > points2
                }
            }
            print("Sorted Users: \(sorted)")
            return sorted
    }

    var body: some View {
        NavigationSplitView {
            if modelData.isLoading {
                ProgressView()
            } else if sortedUsers.isEmpty {
                Text("No profiles available")
                    .foregroundColor(.secondary)
                    .padding()
            } else {
                List(sortedUsers, id: \.uid) { profile in
                    LeaderboardRow(position: sortedUsers.firstIndex(of: profile)! + 1, profile: profile)
                }
                .scrollContentBackground(.hidden)
            }
        } detail: {
            Text("Select a profile")
        }
    }
}

struct LeaderboardRow: View {
    var position: Int
    var profile: Profile

    var body: some View {
        HStack {
            Text("\(position)")
                .bold()
                .frame(width: 30, height: 30)
                .background(Color.blue)
                .foregroundColor(.white)
                .clipShape(Circle())

            Text("\(profile.firstName) \(profile.lastName)")

            Spacer()

            VStack(alignment: .leading, content: {
                Text("Reports:")
                Text("\(profile.reports ?? 0)")
            })

            VStack(alignment: .leading, content: {
                Text("Points:")
                Text("\(profile.points ?? 0)")
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
