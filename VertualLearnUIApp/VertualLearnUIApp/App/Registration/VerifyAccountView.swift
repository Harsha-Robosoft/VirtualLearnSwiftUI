//
//  VerifyAccountView.swift
//  VertualLearnUIApp
//
//  Created by Harsha R Mundaragi  on 05/07/23.
//

import SwiftUI

struct VerifyAccountView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var otp1 = ""
    @State private var otp2 = ""
    @State private var otp3 = ""
    @State private var otp4 = ""
    @State private var otpNotValid = false
    
    @State var forgotPassword : Bool
    
//    func checkForOtp(otpIs: String) {
//        if otpIs == "1234"{
//            otpNotValid = false
//        }else{
//            otpNotValid = true
//        }
//    }
    
    var body: some View {
//        NavigationView {
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
                    Text(forgotPassword ? "Verification" : "Varify Account")
                        .font(.title)
                        .fontWeight(.medium)
                        .fontDesign(.rounded)
                    Text("Please fill in the verification code that has been sent to your mobile number.")
                        .font(.body)
                        .fontDesign(.rounded)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                }
                .padding(.top, 30)
                
                HStack(alignment: .center,spacing: 20){
                    VStack(alignment: .center,spacing: 0){
                        TextField("", text: $otp1)
                            .frame(width: 35, height: 40)
                            .multilineTextAlignment(.center)
                            .onChange(of: otp1) { newValue in
                                if newValue.count > 1 {
                                    otp1 = String(newValue.prefix(1))
                                }
                                if otp1 == "" && otp2 == "" && otp3 == "" && otp4 == ""{
                                    otpNotValid = true
                                }
                            }
                        
                        Rectangle()
                            .frame(width: 35, height: otpNotValid ? 2 : 1)
                            .foregroundColor(otpNotValid ? .red : .gray)
                    }
                    VStack(alignment: .center,spacing: 0){
                        TextField("", text: $otp2)
                            .frame(width: 35, height: 40)
                            .multilineTextAlignment(.center)
                            .onChange(of: otp2) { newValue in
                                if newValue.count > 1 {
                                    otp2 = String(newValue.prefix(1))
                                }
                                if otp1 == "" && otp2 == "" && otp3 == "" && otp4 == ""{
                                    otpNotValid = true
                                }
                            }
                        Rectangle()
                            .frame(width: 35, height: otpNotValid ? 2 : 1)
                            .foregroundColor(otpNotValid ? .red : .gray)
                    }
                    VStack(alignment: .center,spacing: 0){
                        TextField("", text: $otp3)
                            .frame(width: 35, height: 40)
                            .multilineTextAlignment(.center)
                            .onChange(of: otp3) { newValue in
                                if newValue.count > 1 {
                                    otp3 = String(newValue.prefix(1))
                                }
                                if otp1 == "" && otp2 == "" && otp3 == "" && otp4 == ""{
                                    otpNotValid = true
                                }
                            }
                        Rectangle()
                            .frame(width: 35, height: otpNotValid ? 2 : 1)
                            .foregroundColor(otpNotValid ? .red : .gray)
                    }
                    VStack(alignment: .center,spacing: 0){
                        TextField("", text: $otp4)
                            .frame(width: 35, height: 40)
                            .multilineTextAlignment(.center)
                            .onChange(of: otp4) { newValue in
                                if newValue.count > 1 {
                                    otp4 = String(newValue.prefix(1))
                                }
                                if otp1 == "" && otp2 == "" && otp3 == "" && otp4 == ""{
                                    otpNotValid = true
                                }
                            }
                        Rectangle()
                            .frame(width: 35, height: otpNotValid ? 2 : 1)
                            .foregroundColor(otpNotValid ? .red : .gray)
                    }
                    
                }
                .padding(.top, 50)
                
                VStack(alignment: .center,spacing: 20){
                    Text("Didn’t recieve a code?")
                        .font(.body)
                        .fontDesign(.rounded)
                        .foregroundColor(.gray)
                    Text("Resend")
                        .fontWeight(.bold)
                        .fontDesign(.rounded)
                        .foregroundColor(Color("ColorOrenge"))
                }
                .padding(.top, 55)
                if forgotPassword {
                    NavigationLink(destination: CreateNewPasswordView(), label: {
                        Text("Submit")
                            .fontWeight(.medium)
                            .fontDesign(.rounded)
                            .foregroundColor(.white)
                            .frame(width: 327,height: 46)
                            .background(
                            RoundedRectangle(cornerRadius: 5)
                                .fill(Color("ColorOrenge"))
                            )
                        .padding(.top, 30)
                    })
                }else{
                    NavigationLink(destination: PersonalDetailsView(), label: {
                        Text("Verify")
                            .fontWeight(.medium)
                            .fontDesign(.rounded)
                            .foregroundColor(.white)
                            .frame(width: 327,height: 46)
                            .background(
                            RoundedRectangle(cornerRadius: 5)
                                .fill(Color("ColorOrenge"))
                            )
    //                        .onTapGesture {
    //                            print("\(otp1 + otp2 + otp3 + otp4)")
    //                            checkForOtp(otpIs: "\(otp1 + otp2 + otp3 + otp4)")
    //                        }
                        .padding(.top, 30)
                    })
                }
                Spacer()
                    .navigationBarHidden(true)
                if otpNotValid{
                    HStack(alignment: .center,spacing: 10){
                        Image(systemName: "exclamationmark.circle.fill")
                            .foregroundColor(.white)
                        Text("Invalid verification code, please try again")
                            .fontWeight(.light)
                            .fontDesign(.rounded)
                            .foregroundColor(.white)
                    }
                    .frame(width: 400,height: 57)
                    .background(Color.red)
                }
                    
            }
            .padding(.horizontal)
            
//        }
    }
}

struct VerifyAccountView_Previews: PreviewProvider {
    static var previews: some View {
        VerifyAccountView(forgotPassword: false)
    }
}
