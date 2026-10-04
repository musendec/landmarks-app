/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
A view showing featured landmarks above a list of landmarks grouped by category.
*/

import SwiftUI

struct CategoryHome: View {
    @Environment(ModelData.self) var modelData
    @State private var showingProfile = false

    var body: some View {
        NavigationSplitView {
            List {
                modelData.features[0].image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                    .accessibilityIdentifier("categoryHome_featuredImage")

                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
            .accessibilityIdentifier("categoryHome_list")
            .listStyle(.inset)
            .navigationTitle("Featured")
            .toolbar {
                Button {
                    showingProfile.toggle()
                } label: {
                    Label("User Profile", systemImage: "person.crop.circle")
                }
                .accessibilityIdentifier("categoryHome_profileButton")
            }
            .sheet(isPresented: $showingProfile) {
                ProfileHost()
                    .environment(modelData)
                    .accessibilityIdentifier("categoryHome_profileSheet")
            }
        } detail: {
            Text("Select a Landmark")
                .accessibilityIdentifier("categoryHome_detailPlaceholder")
        }
    }
}

#Preview {
    CategoryHome()
        .environment(ModelData())
}
