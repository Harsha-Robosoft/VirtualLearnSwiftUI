//
//  SettingsView.swift
//  VertualLearnUIApp
//
//  Created by Harsha R Mundaragi  on 27/07/23.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State var toggle01 = true
    @State var toggle02 = false
    @State var notificationTapped = false
    var body: some View {
        VStack(alignment: .center, spacing: 0){
            
            HStack{
                VStack(alignment: .leading, spacing: 25){
                    Image(systemName: "arrow.left")
                        .font(.title2)
                        .onTapGesture {
                            presentationMode.wrappedValue.dismiss()
                        }
                    Text("Settings")
                        .font(.title)
                        .fontWeight(.medium)
                        .fontDesign(.rounded)
                }
                Spacer()
            }
            .padding(.top)
            .padding(.bottom, 30)
            
            HStack(alignment: .center, spacing: 20){
                Image(systemName: "gear")
                Text("Notification Setting")
                    .font(.body)
                    .fontDesign(.rounded)
                Spacer()
            }
            .padding(.vertical, 15)
            .onTapGesture {
                withAnimation(.easeOut){
                    notificationTapped.toggle()
                }
            }
            
            if notificationTapped{
                VStack{
                    Toggle(isOn: $toggle01) {
                        Text("Push Notification")
                            .font(.body)
                            .fontDesign(.rounded)
                    }
                    .padding(.leading, 40)
                    Toggle(isOn: $toggle02) {
                        Text("Notification Sound")
                            .font(.body)
                            .fontDesign(.rounded)
                    }
                    .padding(.leading, 40)
                }
            }

            NavigationLink(destination: ServicePrivacyView(viewName: "Privacy Policy", content: """
 This Privacy Policy was last updated on January 4, 2021.

 Thank you for joining the world’s largest online learning marketplace. We at VirtuaLearn (“VirtuaLearn”, “we”, “us”) respect your privacy and want you to understand how we collect, use, and share data about you. This Privacy Policy covers our data collection practices and describes your rights to access, correct, or restrict our use of your personal data.

 Unless we link to a different policy or state otherwise, this Privacy Policy applies when you visit or use the VirtuaLearn mobile application, APIs or related services (the “Services”).

 By using the Services, you agree to the terms of this Privacy Policy. You shouldn’t use the Services if you don’t agree with this Privacy Policy or any other agreement that governs your use of the Services.
 """)){
                HStack(alignment: .center, spacing: 20){
                    Image(systemName: "bag")
                    Text("Privacy Policy")
                        .font(.body)
                        .fontDesign(.rounded)
                    Spacer()
                }
                .padding(.vertical, 15)
                .foregroundColor(.black)
            }
            
            NavigationLink(destination: ServicePrivacyView(viewName: "Terms of services", content: """
 These Terms of Services ("Terms") were last updated on September 16, 2020.

 VirtualLearn’s mission is to improve lives through learning. We enable anyone anywhere to create and share educational courses (instructors) and to enroll in these educational courses to learn (students). We consider our marketplace model the best way to offer valuable educational content to our users. We need rules to keep our platform and services safe for you, us and our student and instructor community. These Terms apply to all your activities on the VirtualLearn mobile application and our APIs and other related services (“Services”).

 If you publish a course on the VirtualLearn platform, you must also agree to the Instructor Terms. We also provide details regarding our processing of personal data of our students and instructors in our Privacy Policy. If you are using VirtualLearn as part of your employer’s VirtualLearn For Business learning and development program, you can consult our VirtualLearn for Business Privacy Statement.
 """)){
                HStack(alignment: .center, spacing: 20){
                    Image(systemName: "doc")
                    Text("Terms of services")
                        .font(.body)
                        .fontDesign(.rounded)
                    Spacer()
                }
                .padding(.vertical, 15)
                .foregroundColor(.black)
            }
            
            
            Spacer()
                .navigationBarHidden(true)
        }
        .padding(.horizontal)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
