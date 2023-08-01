//
//  ServicePrivacyView.swift
//  VertualLearnUIApp
//
//  Created by Harsha R Mundaragi  on 27/07/23.
//

import SwiftUI

struct ServicePrivacyView: View {
    @Environment(\.presentationMode) var presentationMode
    let viewName: String
    let content: String
    var body: some View {
        VStack{
            HStack{
                VStack(alignment: .leading, spacing: 25){
                    Image(systemName: "arrow.left")
                        .font(.title2)
                        .onTapGesture {
                            presentationMode.wrappedValue.dismiss()
                        }
                    Text(viewName)
                        .font(.title)
                        .fontWeight(.medium)
                        .fontDesign(.rounded)
                }
                Spacer()
            }
            .padding(.top)
            .padding(.bottom, 30)
            
            Text(content)
                .font(.system(size: 16))
                .fontDesign(.rounded)
                .foregroundColor(.gray)
                .multilineTextAlignment(.leading)

            
            Spacer()
                .navigationBarHidden(true)
        }
        .padding(.horizontal)
    }
}

struct ServicePrivacyView_Previews: PreviewProvider {
    static var previews: some View {
        ServicePrivacyView(viewName: "Settings", content: """
These Terms of Services ("Terms") were last updated on September 16, 2020.

VirtualLearn’s mission is to improve lives through learning. We enable anyone anywhere to create and share educational courses (instructors) and to enroll in these educational courses to learn (students). We consider our marketplace model the best way to offer valuable educational content to our users. We need rules to keep our platform and services safe for you, us and our student and instructor community. These Terms apply to all your activities on the VirtualLearn mobile application and our APIs and other related services (“Services”).

If you publish a course on the VirtualLearn platform, you must also agree to the Instructor Terms. We also provide details regarding our processing of personal data of our students and instructors in our Privacy Policy. If you are using VirtualLearn as part of your employer’s VirtualLearn For Business learning and development program, you can consult our VirtualLearn for Business Privacy Statement.
""")
    }
}
