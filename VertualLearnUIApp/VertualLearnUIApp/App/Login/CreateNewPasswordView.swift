//
//  CreateNewPasswordView.swift
//  VertualLearnUIApp
//
//  Created by Harsha R Mundaragi  on 06/07/23.
//

import SwiftUI

struct CreateNewPasswordView: View {
    
    @State private var password01 = ""
    @State private var password02 = ""
    
    @State private var password01Tap = false
    @State private var password02Tap = false
    
    var body: some View {
        VStack(alignment: .center,spacing: 0){
            VStack(alignment: .leading, spacing: 15){
                Text("Create New Password")
                    .font(.title)
                    .fontWeight(.medium)
                    .fontDesign(.rounded)
                Text("Your password must have at least 6 or more characters.")
                    .font(.body)
                    .fontDesign(.rounded)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            }
            .padding(.top, 50)
            .padding(.trailing)
            
            VStack(alignment: .leading,spacing: 0){
                Text("New Password")
                    .font(.system(size: 16))
                    .fontDesign(.rounded)
                    .foregroundColor(.gray)
                    .onTapGesture {
                        withAnimation(.easeInOut){
                            password01Tap.toggle()
                        }
                    }
                if password01Tap {
                    SecureField("", text: $password01)
                        .padding(.top)
                        .padding(.bottom,4)
                }
                Rectangle()
                    .frame(width: 340,height: 1)
                    .foregroundColor(password01Tap ? .black : .gray.opacity(0.5))
                    .padding(.top, 5)
            }
            .padding(.top, 40)
            .padding(.horizontal, 10)
            
            VStack(alignment: .leading,spacing: 0){
                Text("Confirm New password")
                    .font(.system(size: 16))
                    .fontDesign(.rounded)
                    .foregroundColor(.gray)
                    .onTapGesture {
                        withAnimation(.easeInOut){
                            password02Tap.toggle()
                        }
                    }
                    
                if password02Tap {
                    SecureField("", text: $password02)
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
            
            NavigationLink(destination: SuccessView(passwordChanges: true), label: {
                Text("Rest Password")
                    .fontWeight(.medium)
                    .fontDesign(.rounded)
                    .foregroundColor(.white)
                    .frame(width: 327,height: 46)
                    .background(
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color("ColorOrenge"))
                    )
                    .padding(.top, 55)
            })
            Spacer()
                .navigationBarHidden(true)
        }
        .padding(.horizontal)
    }
}

struct CreateNewPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        CreateNewPasswordView()
    }
}
