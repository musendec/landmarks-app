/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
A view showing the details for a landmark.
*/

import SwiftUI

struct LandmarkDetail: View {
    @Environment(ModelData.self) var modelData
    var landmark: Landmark

    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }

    var body: some View {
        @Bindable var modelData = modelData

        ScrollView {
            MapView(coordinate: landmark.locationCoordinate)
                .frame(height: 300)
                .accessibilityIdentifier("landmarkDetail_map")

            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)
                .accessibilityIdentifier("landmarkDetail_circleImage")

            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                        .accessibilityIdentifier("landmarkDetail_name")
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }

                HStack {
                    Text(landmark.park)
                        .accessibilityIdentifier("landmarkDetail_park")
                    Spacer()
                    Text(landmark.state)
                        .accessibilityIdentifier("landmarkDetail_state")
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)

                Divider()

                Text("About \(landmark.name)")
                    .font(.title2)
                    .accessibilityIdentifier("landmarkDetail_aboutTitle")
                Text(landmark.description)
                    .accessibilityIdentifier("landmarkDetail_description")
            }
            .padding()
        }
        .accessibilityIdentifier("landmarkDetail_scrollView")
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let modelData = ModelData()
    return LandmarkDetail(landmark: modelData.landmarks[0])
        .environment(modelData)
}
