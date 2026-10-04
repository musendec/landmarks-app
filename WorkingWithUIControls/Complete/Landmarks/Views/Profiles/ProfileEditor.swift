/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
An editable profile view.
*/

import SwiftUI

struct ProfileEditor: View {
    @Binding var profile: Profile

    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
        return min...max
    }

    var body: some View {
        List {
            HStack {
                Text("Username")
                Spacer()
                TextField("Username", text: $profile.username)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.trailing)
                    .accessibilityIdentifier("profileEditor_usernameField")
            }

            Toggle(isOn: $profile.prefersNotifications) {
                Text("Enable Notifications")
            }
            .accessibilityIdentifier("profileEditor_notificationsToggle")

            Picker("Seasonal Photo", selection: $profile.seasonalPhoto) {
                ForEach(Profile.Season.allCases) { season in
                    Text(season.rawValue).tag(season)
                }
            }
            .accessibilityIdentifier("profileEditor_seasonalPhotoPicker")

            DatePicker(selection: $profile.goalDate, in: dateRange, displayedComponents: .date) {
                Text("Goal Date")
            }
            .accessibilityIdentifier("profileEditor_goalDatePicker")
        }
        .accessibilityIdentifier("profileEditor_list")
    }
}

#Preview {
    ProfileEditor(profile: .constant(.default))
}
