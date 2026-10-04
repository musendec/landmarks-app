/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
A view displaying information about a hike, including an elevation graph.
*/

import SwiftUI

extension AnyTransition {
    static var moveAndFade: AnyTransition {
        .asymmetric(
            insertion: .move(edge: .trailing).combined(with: .opacity),
            removal: .scale.combined(with: .opacity)
        )
    }
}

struct HikeView: View {
    var hike: Hike
    @State private var showDetail = false

    var body: some View {
        VStack {
            HStack {
                HikeGraph(hike: hike, path: \.elevation)
                    .frame(width: 50, height: 30)
                    .accessibilityIdentifier("hikeView_\(hike.name)_graph")

                VStack(alignment: .leading) {
                    Text(hike.name)
                        .font(.headline)
                        .accessibilityIdentifier("hikeView_\(hike.name)_name")
                    Text(hike.distanceText)
                        .accessibilityIdentifier("hikeView_\(hike.name)_distance")
                }

                Spacer()

                Button {
                    withAnimation {
                        showDetail.toggle()
                    }
                } label: {
                    Label("Graph", systemImage: "chevron.right.circle")
                        .labelStyle(.iconOnly)
                        .imageScale(.large)
                        .rotationEffect(.degrees(showDetail ? 90 : 0))
                        .scaleEffect(showDetail ? 1.5 : 1)
                        .padding()
                }
                .accessibilityIdentifier("hikeView_\(hike.name)_detailButton")
            }

            if showDetail {
                HikeDetail(hike: hike)
                    .transition(.moveAndFade)
            }
        }
        .accessibilityIdentifier("hikeView_\(hike.name)")
    }
}

#Preview {
    VStack {
        HikeView(hike: ModelData().hikes[0])
            .padding()
        Spacer()
    }
}
