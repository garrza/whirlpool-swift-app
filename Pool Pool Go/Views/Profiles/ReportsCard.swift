//
//  ReportsCard.swift
//  Pool Pool Go
//
//  Created by ramiro garza on 4/3/24.
//

import SwiftUI

struct ReportsCard: View {
    let profile: Profile
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "folder.fill") // Icon
                    .foregroundColor(.blue)
                    .font(.largeTitle)
                Text("Mis reportes:")
                    .font(.headline)
                    .foregroundColor(.primary)
                    .bold()
            }
            .padding(.bottom, 5)
            
            Text("\(profile.reports)")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.primary)
        }
        .padding()
        .background(Color.gray.opacity(0.5))
        .cornerRadius(15)
    }
}

struct ReportsCardPreviews: PreviewProvider {
    static var previews: some View {
        ReportsCard(profile: Profile.default)
    }
}
