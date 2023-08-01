//
//  NewAccountView.swift
//  VertualLearnUIApp
//
//  Created by Harsha R Mundaragi  on 05/07/23.
//

import SwiftUI

struct NewAccountView: View {
    
    @State private var mobileNum = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(alignment: .center,spacing: 0){
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
                Text("New Account")
                    .font(.title)
                    .fontWeight(.medium)
                    .fontDesign(.rounded)
                Text("Create a new account to get access to all courses by entering your mobile number.")
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
            
            VStack(alignment: .center,spacing: 20){
                NavigationLink(destination: VerifyAccountView(forgotPassword: false), label: {
                    Text("Continue")
                        .fontWeight(.medium)
                        .fontDesign(.rounded)
                        .foregroundColor(.white)
                        .frame(width: 327,height: 46)
                        .background(
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color("ColorOrenge"))
                        )
                })
                    
                
                HStack(alignment: .center,spacing: 4){
                    Text("Already have an account?")
                        .font(.system(size: 16))
                        .fontWeight(.light)
                        .fontDesign(.rounded)
                        .foregroundColor(.gray)
                    Text("Login")
                        .fontWeight(.bold)
                        .fontDesign(.rounded)
                        .foregroundColor(Color("ColorOrenge"))
                }
            }
            .padding(.top, 50)
            
            Spacer()
            HStack(alignment: .center,spacing: 20){
                Image("btn_SM_facebook")
                Image("btn_SM_google")
            }
            .navigationBarHidden(true)
        }
        .padding(.horizontal, 13)
    }
}

struct NewAccountView_Previews: PreviewProvider {
    static var previews: some View {
        NewAccountView()
    }
}
