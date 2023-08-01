//
//  OnboardingView.swift
//  VertualLearnUIApp
//
//  Created by Harsha R Mundaragi  on 05/07/23.
//

import SwiftUI

struct OnboardingView: View {
    let onboard: Onboarding
    var body: some View {
        VStack(alignment: .center,spacing: 150){
            Image(onboard.imageName)
            VStack(alignment: .leading, spacing: 15){
                Text(onboard.title)
                    .font(.title)
                    .fontWeight(.medium)
                    .fontDesign(.rounded)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                Text(onboard.subTitle)
                    .font(.footnote)
                    .fontDesign(.rounded)
                    .padding(.trailing, 70)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.leading)
                    .lineLimit(4)
            }
            .padding(.leading, 20)
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(onboard: onboardingData[0])
    }
}
