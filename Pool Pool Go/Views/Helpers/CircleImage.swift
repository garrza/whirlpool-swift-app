//
//  CircleImage.swift
//  Pool Pool Go
//
//  Created by ramiro garza on 3/22/24.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    
    var body: some View {
        image
            .resizable()
            .frame(width: 200, height: 200)
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 6)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        let location = LocationsDataService.locations.first!
        CircleImage(image: Image(location.imageName))
    }
}
