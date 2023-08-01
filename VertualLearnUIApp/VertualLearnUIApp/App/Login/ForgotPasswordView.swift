//
//  ForgotPasswordView.swift
//  VertualLearnUIApp
//
//  Created by Harsha R Mundaragi  on 06/07/23.
//

import SwiftUI

struct ForgotPasswordView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var mobileNum = ""
    var body: some View {
        VStack(alignment: .center, spacing: 0){
            HStack(alignment: .center, spacing: 0){
                Image(systemName: "arrow.left")
                    .font(.title2)
                    .onTapGesture {
                        presentationMode.wrappedValue.dismiss()
                    }
                    Spacer()
            }
            .padding(.top, 20)
            VStack(alignment: .leading, spacing: 15){
                Text("Foregot Password")
                    .font(.title)
                    .fontWeight(.medium)
                    .fontDesign(.rounded)
                Text("Please enter your phone number. You will receive a code to create a new password.")
                    .font(.body)
                    .fontDesign(.rounded)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    
            }
            .padding(.top, 20)
            
            VStack(alignment: .center,spacing: 0){
                HStack(alignment: .center, spacing: 15){
                    Text("+91")
                        .foregroundColor(Color(uiColor: UIColor(red: 0, green: 0, blue: 0.7, alpha: 1)))
                        .font(.system(size: 16))
                        .fontWeight(.light)
                    TextField("Enter your mobile number", text: $mobileNum)
                }
                .padding(.bottom, 10)
                RoundedRectangle(cornerRadius: 4)
                    .fill(.gray)
                    .frame(width: 365, height: 0.7)
            }
            .padding(.top, 55)
            
            NavigationLink(destination: VerifyAccountView(forgotPassword: true), label: {
                Text("Send")
                    .fontWeight(.medium)
                    .fontDesign(.rounded)
                    .foregroundColor(.white)
                    .frame(width: 327,height: 46)
                    .background(
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color("ColorOrenge"))
                    )
                    .padding(.top, 40)
            })
            Spacer()
                .navigationBarHidden(true)
        }
        .padding(.horizontal)
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}
