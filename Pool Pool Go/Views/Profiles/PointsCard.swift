//
//  PointsCard.swift
//  Pool Pool Go
//
//  Created by ramiro garza on 4/3/24.
//

import SwiftUI

struct PointsCard: View {
    let profile: Profile
    
    var body: some View {
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
            
            Text("\(profile.points)")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.white)
        }
        .padding()
        .background(Color.blue)
        .cornerRadius(15)
    }
}

struct PointsCardPreviews: PreviewProvider {
    static var previews: some View {
        PointsCard(profile: Profile.default)
    }
}
