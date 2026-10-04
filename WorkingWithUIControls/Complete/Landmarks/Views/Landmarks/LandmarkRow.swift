/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
A single row to be displayed in a list of landmarks.
*/

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark

    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
                .accessibilityIdentifier("landmarkRow_\(landmark.name)_image")
            Text(landmark.name)
                .accessibilityIdentifier("landmarkRow_\(landmark.name)_text")

            Spacer()

            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
                    .accessibilityIdentifier("landmarkRow_\(landmark.name)_favoriteIcon")
            }
        }
        .accessibilityIdentifier("landmarkRow_\(landmark.name)")
    }
}

#Preview {
    let landmarks = ModelData().landmarks
    return Group {
        LandmarkRow(landmark: landmarks[0])
        LandmarkRow(landmark: landmarks[1])
    }
}
