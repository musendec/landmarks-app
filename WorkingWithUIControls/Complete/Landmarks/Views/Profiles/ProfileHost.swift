/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
A view that hosts the profile viewer and editor.
*/

import SwiftUI

struct ProfileHost: View {
    @Environment(\.editMode) var editMode
    @Environment(ModelData.self) var modelData
    @State private var draftProfile = Profile.default

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                if editMode?.wrappedValue == .active {
                    Button("Cancel", role: .cancel) {
                        draftProfile = modelData.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                    .accessibilityIdentifier("profileHost_cancelButton")
                }
                Spacer()
                EditButton()
                    .accessibilityIdentifier("profileHost_editButton")
            }

            if editMode?.wrappedValue == .inactive {
                ProfileSummary(profile: modelData.profile)
            } else {
                ProfileEditor(profile: $draftProfile)
                    .onAppear {
                        draftProfile = modelData.profile
                    }
                    .onDisappear {
                        modelData.profile = draftProfile
                    }
            }
        }
        .padding()
        .accessibilityIdentifier("profileHost_container")
    }
}

#Preview {
    ProfileHost()
        .environment(ModelData())
}
