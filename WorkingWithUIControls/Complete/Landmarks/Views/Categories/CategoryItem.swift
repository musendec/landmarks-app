/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
A view showing a single category item.
*/

import SwiftUI

struct CategoryItem: View {
    var landmark: Landmark

    var body: some View {
        VStack(alignment: .leading) {
            landmark.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
                .accessibilityIdentifier("categoryItem_\(landmark.name)_image")
            Text(landmark.name)
                .foregroundStyle(.primary)
                .font(.caption)
                .accessibilityIdentifier("categoryItem_\(landmark.name)_text")
        }
        .padding(.leading, 15)
        .accessibilityIdentifier("categoryItem_\(landmark.name)")
    }
}

#Preview {
    CategoryItem(landmark: ModelData().landmarks[0])
}
