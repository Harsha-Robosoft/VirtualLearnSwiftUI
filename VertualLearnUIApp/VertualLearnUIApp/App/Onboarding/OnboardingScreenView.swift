//
//  LogInView.swift
//  VertualLearnUIApp
//
//  Created by Harsha R Mundaragi  on 04/07/23.
//

import SwiftUI

struct OnboardingScreenView: View {
    
    @State private var pageIndex = 0
    @AppStorage("ShowLog") var showLog = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            HStack{
                Image("img_virtuallearn_lockup")
                Spacer()
            }
                .padding(.horizontal)
                .padding(.vertical)
            TabView(selection: $pageIndex){
                ForEach(0..<3){ index in
                    VStack(alignment: .center,spacing: 0){
                            OnboardingView(onboard: onboardingData[index])
                    }
                    .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            Spacer()
        }
        .overlay(
            HStack(alignment: .center, spacing: 5){
                NavigationLink(destination: LoginRegisterView(), label: {
                    Text("SKIP")
                        .font(.system(size: 14, weight: .light))
                        .foregroundColor(.black)
                        .onTapGesture {
                            showLog = true
                        }
                })
                
                Spacer()
                HStack{
                    ForEach(0..<3){ index2 in
                        
                        if index2 == pageIndex{
                            Rectangle()
                                .frame(width: 40, height: 8)
                                .cornerRadius(10)
                                .foregroundColor(Color("ColorOrenge"))
                        }else{
                            Circle()
                                .frame(width: 8, height: 8)
                                .foregroundColor(.gray.opacity(0.4))
                        }
                    }
                }
                Spacer()
                if pageIndex == 2{
                    NavigationLink(destination: LoginRegisterView(),
                                   label: {
                        Image(systemName: "checkmark")
                            .font(.title3)
                            .foregroundColor(.white)
                            .frame(width: 50, height: 50)
                            .background(
                            Circle()
                                .fill(Color("ColorOrenge"))
                            )
                            .onTapGesture {
                                showLog = true
                            }
                    })
                    
                }else{
                    Image(systemName: "arrow.right")
                        .font(.title3)
                        .foregroundColor(.white)
                        .frame(width: 50, height: 50)
                        .background(
                        Circle()
                            .fill(Color("ColorOrenge"))
                        )
                        .onTapGesture {
                            if pageIndex < 2{
                                withAnimation(.easeInOut){
                                    pageIndex += 1
                                }
                            }
                        }
                }
            }
                .padding(.horizontal),
            alignment: .bottom
        )
        .navigationBarHidden(true)
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingScreenView()
    }
}
