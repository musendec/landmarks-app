/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
A view that summarizes a profile.
*/

import SwiftUI

struct ProfileSummary: View {
    @Environment(ModelData.self) var modelData
    var profile: Profile

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text(profile.username)
                    .bold()
                    .font(.title)
                    .accessibilityIdentifier("profileSummary_username")

                Text("Notifications: \(profile.prefersNotifications ? "On": "Off" )")
                    .accessibilityIdentifier("profileSummary_notifications")
                Text("Seasonal Photos: \(profile.seasonalPhoto.rawValue)")
                    .accessibilityIdentifier("profileSummary_seasonalPhoto")
                (Text("Goal Date: ") + Text(profile.goalDate, style: .date))
                    .accessibilityIdentifier("profileSummary_goalDate")

                Divider()

                VStack(alignment: .leading) {
                    Text("Completed Badges")
                        .font(.headline)
                        .accessibilityIdentifier("profileSummary_badgesHeading")

                    ScrollView(.horizontal) {
                        HStack {
                            HikeBadge(name: "First Hike")
                            HikeBadge(name: "Earth Day")
                                .hueRotation(Angle(degrees: 90))
                            HikeBadge(name: "Tenth Hike")
                                .grayscale(0.5)
                                .hueRotation(Angle(degrees: 45))
                        }
                        .padding(.bottom)
                    }
                    .accessibilityIdentifier("profileSummary_badgesScroll")
                }

                Divider()

                VStack(alignment: .leading) {
                    Text("Recent Hikes")
                        .font(.headline)
                        .accessibilityIdentifier("profileSummary_hikesHeading")

                    HikeView(hike: modelData.hikes[0])
                }
            }
            .padding()
        }
        .accessibilityIdentifier("profileSummary_scrollView")
    }
}

#Preview {
    ProfileSummary(profile: Profile.default)
        .environment(ModelData())
}
