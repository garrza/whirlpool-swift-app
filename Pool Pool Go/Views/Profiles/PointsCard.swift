//
//  PointsCard.swift
//  Pool Pool Go
//
//  Created by ramiro garza on 4/3/24.
//

import SwiftUI

struct PointsCard: View {
    @EnvironmentObject var modelData: ModelData

    
    var body: some View {
            if let firstProfile = modelData.activeProfile {
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "star.fill") // Icon
                            .foregroundColor(.yellow)
                            .font(.largeTitle)
                        Text("Mis puntos:")
                            .font(.headline)
                            .foregroundColor(.white)
                            .bold()
                    }
                    .padding(.bottom, 5)
                    
                    Text("\(firstProfile.points)")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                }
                .padding()
                .background(Color.blue)
                .cornerRadius(15)
            } else {
                Text("No profile available")
            }
        }
    }

struct PointsCardPreviews: PreviewProvider {
    static var previews: some View {
        PointsCard()
            .environmentObject(ModelData())
    }
}
