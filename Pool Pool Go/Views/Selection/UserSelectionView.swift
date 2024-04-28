//
//  UserSelectionView.swift
//  Pool Pool Go
//
//  Created by ramiro garza on 4/22/24.
//

import SwiftUI

struct UserSelectionView: View {
    @EnvironmentObject var modelData: ModelData
    @State private var selectedProfile: Profile?

    var body: some View {
        if selectedProfile == nil { // Show the UserSelectionView if no profile is selected
            ZStack {
                VStack {
                    Spacer()
                    Image("launcher")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200)

                    Text("Selecciona usuario")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding()

                    List(modelData.profiles, id: \.uid) { profile in
                        Button(action: {
                            selectedProfile = profile
                            modelData.activeProfile = profile // Set the selected profile as the active one
                        }) {
                            Text("\(profile.firstName) \(profile.lastName)")
                        }
                    }
                }

                if modelData.isLoading {
                    ProgressView()
                }
            }
        } else {
            EmptyView()
        }
    }
}



#Preview {
    UserSelectionView()
        .environmentObject(ModelData())
}
