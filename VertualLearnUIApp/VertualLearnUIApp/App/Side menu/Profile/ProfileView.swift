//
//  ProfileView.swift
//  VertualLearnUIApp
//
//  Created by Harsha R Mundaragi  on 27/07/23.
//

import SwiftUI

struct ProfileView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var showSideMenu: Bool
    var body: some View {
        VStack(alignment: .center, spacing: 0){
            Image("img_profiledetails_bg")
                .resizable()
                .scaledToFill()
                .frame(width:UIScreen.screenWidth,height: 280)
                .overlay(
                    VStack(alignment: .center, spacing: 20){
                        HStack(alignment: .center){
                            Image("icn_hamburgermenu_white")
                                .onTapGesture {
                                    showSideMenu = true
                                    presentationMode.wrappedValue.dismiss()
                                }
                            Spacer()
                        }
                        
                        HStack(alignment: .center){
                            Text("Profile")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            Spacer()
                            NavigationLink(destination: EditProfileView()){
                                Image(systemName: "pencil")
                                    .resizable()
                                    .scaledToFill()
                                    .font(.title)
                                    .fontWeight(.heavy)
                                    .foregroundColor(.white)
                                    .frame(width: 18, height: 18)
                            }
                        }
                        
                        HStack(alignment: .center, spacing: 15){
                           Image("img_profile pic_menu")
                            VStack(alignment: .leading, spacing: 5){
                                Text("Harsha R Mundaragi")
                                        .font(.body)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                Text("IOS Dev")
                                    .font(.footnote)
                                    .fontWeight(.medium)
                                    .foregroundColor(.white)
                            }
                            Spacer()
                        }
                        .padding(.top, 20)
                    }
                        .padding(.top, 40)
                        .fontDesign(.rounded)
                        .padding(.horizontal),
                    alignment: .center
                )
            
            Text("Has Completed")
                .font(.footnote)
                .fontWeight(.medium)
                .foregroundColor(.gray)
                .padding(.vertical, 20)
            
            HStack(alignment: .center, spacing: 25){
                ProfileDetailsView(num: "06", title: "Courses")
                ProfileDetailsView(num: "102", title: "Chapters")
                ProfileDetailsView(num: "24", title: "Test")
            }
            HStack{
                Text("Personal Details")
                    .font(.body)
                    .fontWeight(.medium)
                    .fontDesign(.rounded)
                    .foregroundColor(.black.opacity(0.8))
                Spacer()
            }
            .padding(.vertical, 35)
            .padding(.horizontal)
            
            VStack(spacing: 15){
                PersonDetailsView(txt01: "Name", txt02: "Harsha R Mundaragi")
                PersonDetailsView(txt01: "Username", txt02: "Haru")
                PersonDetailsView(txt01: "Email", txt02: "mundaragi@gmail.com")
                PersonDetailsView(txt01: "Mobile", txt02: "+918105524526")
                PersonDetailsView(txt01: "Occupation", txt02: "Racer")
                PersonDetailsView(txt01: "Date of Birth", txt02: "20/10/200")
            }
            .padding(.horizontal)
            
            Spacer()
            
            HStack(alignment:.center, spacing: 15){
                Image("icn_privacy")
                    .padding(.leading, 8)
                
                VStack(alignment: .leading, spacing: 2){
                    Text("Privacy")
                        .font(.system(size: 15))
                        .fontWeight(.bold)
                        .foregroundColor(.accentColor)
                    Text("Change your password")
                        .font(.footnote)
                        .fontWeight(.light)
                        .foregroundColor(.gray)
                }
                .fontDesign(.rounded)
                Spacer()
                Image(systemName: "chevron.right")
                    .fontWeight(.medium)
                    .foregroundColor(.accentColor)
                    .padding(.trailing)
            }
            .frame(width: UIScreen.screenWidth - 30, height: 56, alignment: .center)
            .background(Color.white)
            .cornerRadius(5)
            .shadow(color: .black.opacity(0.1), radius: 5,x: 0,y: 0)
            
            .navigationBarHidden(true)
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct ProfileView_Previews: PreviewProvider {
    @State static var show = false
    static var previews: some View {
        ProfileView(showSideMenu: $show)
    }
}

struct ProfileDetailsView: View{
    let num: String
    let title: String
    var body: some View{
        VStack(alignment: .center, spacing: 0){
            Text(num)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.blue.opacity(0.8))
            Text(title)
                .font(.footnote)
                .fontWeight(.medium)
                .foregroundColor(.gray)
        }
        .fontDesign(.rounded)
        .frame(width: 95, height: 85, alignment: .center)
        .background(Color.white)
        .cornerRadius(5)
        .shadow(color: .black.opacity(0.1), radius: 5, x: 0,y: 0)
    }
}

struct PersonDetailsView: View{
    let txt01: String
    let txt02: String
    var body: some View{
        HStack{
            Text(txt01)
                .font(.system(size: 14))
                .fontWeight(.regular)
                .foregroundColor(.gray)
            Spacer()
            Text(txt02)
                .font(.system(size: 16))
                .fontWeight(.medium)
                .foregroundColor(.black)
        }
        .fontDesign(.rounded)
    }
}
