//
//  PersonalDetailsView.swift
//  VertualLearnUIApp
//
//  Created by Harsha R Mundaragi  on 05/07/23.
//

import SwiftUI

struct PersonalDetailsView: View {
    @State private var fullName = ""
    @State private var userName = ""
    @State private var email = ""
    @State private var password01 = ""
    @State private var password02 = ""
    
    @State private var fullNameTap = false
    @State private var userNameTap = false
    @State private var emailTap = false
    @State private var password01Tap = false
    @State private var password02Tap = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 0){
            VStack(alignment: .leading, spacing: 15){
                Text("Personal Details")
                    .font(.title)
                    .fontWeight(.medium)
                    .fontDesign(.rounded)
                Text("Please fill out the fields below so we can learn some information about you.")
                    .font(.body)
                    .fontDesign(.rounded)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            }
            .padding(.top, 45)
            
            HStack(alignment: .center,spacing: 0){
                VStack(alignment: .leading, spacing: 10){
                    Text("Mobile Number")
                        .font(.system(size: 16))
                        .fontDesign(.rounded)
                        .foregroundColor(.gray)
                    Text("+918105524526")
                        .font(.title3)
                        .foregroundColor(.blue)
                }
                .padding(.top, 30)
                Spacer()
            }
            .padding(.leading,10)
            
            VStack(alignment: .leading,spacing: 0){
                Text("Full name")
                    .font(.system(size: 16))
                    .fontDesign(.rounded)
                    .foregroundColor(.gray)
                    .onTapGesture {
                        withAnimation(.easeInOut){
                            fullNameTap.toggle()
                        }
                    }
                    
                if fullNameTap {
                    TextField("", text: $fullName)
                        .padding(.top, 10)
                        .padding(.bottom,4)
                }
                Rectangle()
                    .frame(width: 340,height: 1)
                    .foregroundColor(fullNameTap ? .black : .gray.opacity(0.5))
                    .padding(.top, 5)
            }
            .padding(.top, 40)
            .padding(.horizontal, 10)
            
            VStack(alignment: .leading,spacing: 0){
                Text("UserName")
                    .font(.system(size: 16))
                    .fontDesign(.rounded)
                    .foregroundColor(.gray)
                    .onTapGesture {
                        withAnimation(.easeInOut){
                            userNameTap.toggle()
                        }
                    }
                    
                if userNameTap {
                    TextField("", text: $userName)
                        .padding(.top)
                        .padding(.bottom,4)
                }
                Rectangle()
                    .frame(width: 340,height: 1)
                    .foregroundColor(userNameTap ? .black : .gray.opacity(0.5))
                    .padding(.top, 5)
            }
            .padding(.top, userNameTap ? 10 : 40)
            .padding(.horizontal, 10)
            
            VStack(alignment: .leading,spacing: 0){
                Text("Email")
                    .font(.system(size: 16))
                    .fontDesign(.rounded)
                    .foregroundColor(.gray)
                    .onTapGesture {
                        withAnimation(.easeInOut){
                            emailTap.toggle()
                        }
                    }
                    
                if emailTap {
                    TextField("", text: $email)
                        .padding(.top)
                        .padding(.bottom,4)
                }
                Rectangle()
                    .frame(width: 340,height: 1)
                    .foregroundColor(emailTap ? .black : .gray.opacity(0.5))
                    .padding(.top, 5)
            }
            .padding(.top, emailTap ? 10 : 40)
            .padding(.horizontal, 10)
            
            VStack(alignment: .leading,spacing: 0){
                HStack(alignment: .center, spacing: 5){
                    Text("Password")
                        .font(.system(size: 16))
                        .fontDesign(.rounded)
                        .foregroundColor(.gray)
                        .onTapGesture {
                            withAnimation(.easeInOut){
                                password01Tap.toggle()
                            }
                        }
                    
                    Image(systemName: "exclamationmark.circle.fill")
                        .font(.footnote)
                        .foregroundColor(.yellow)
                }
                    
                if password01Tap {
                    TextField("", text: $password01)
                        .padding(.top)
                        .padding(.bottom,4)
                }
                Rectangle()
                    .frame(width: 340,height: 1)
                    .foregroundColor(password01Tap ? .black : .gray.opacity(0.5))
                    .padding(.top, 5)
            }
            .padding(.top, password01Tap ? 10 : 40)
            .padding(.horizontal, 10)
            
            VStack(alignment: .leading,spacing: 0){
                Text("Confirm password")
                    .font(.system(size: 16))
                    .fontDesign(.rounded)
                    .foregroundColor(.gray)
                    .onTapGesture {
                        withAnimation(.easeInOut){
                            password02Tap.toggle()
                        }
                    }
                    
                if password02Tap {
                    TextField("", text: $password02)
                        .padding(.top)
                        .padding(.bottom,4)
                }
                Rectangle()
                    .frame(width: 340,height: 1)
                    .foregroundColor(password02Tap ? .black : .gray.opacity(0.5))
                    .padding(.top, 5)
            }
            .padding(.top, password02Tap ? 10 : 40)
            .padding(.horizontal, 10)
            
            Spacer()
            
            NavigationLink(destination: SuccessView(passwordChanges: false), label: {
                Text("Register")
                    .fontWeight(.medium)
                    .fontDesign(.rounded)
                    .foregroundColor(.white)
                    .frame(width: 327,height: 46)
                    .background(
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color("ColorOrenge"))
                    )
            })
            .navigationBarHidden(true)
        }
        .padding(.horizontal)
    }
}


struct PersonalDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalDetailsView()
    }
}
