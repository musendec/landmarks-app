/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
A view showing a list of landmarks.
*/

import SwiftUI

struct LandmarkList: View {
    @Environment(ModelData.self) var modelData
    @State private var showFavoritesOnly = false

    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }

    var body: some View {
        NavigationSplitView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                .accessibilityIdentifier("landmarkList_favoritesToggle")

                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                    .accessibilityIdentifier("landmarkList_link_\(landmark.name)")
                }
            }
            .accessibilityIdentifier("landmarkList_list")
            .animation(.default, value: filteredLandmarks)
            .navigationTitle("Landmarks")
        } detail: {
            Text("Select a Landmark")
                .accessibilityIdentifier("landmarkList_detailPlaceholder")
        }
    }
}

#Preview {
    LandmarkList()
        .environment(ModelData())
}
