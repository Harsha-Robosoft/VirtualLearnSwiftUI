//
//  ContentView.swift
//  VertualLearnUIApp
//
//  Created by Harsha R Mundaragi  on 04/07/23.
//

import SwiftUI

struct ContentView: View {
    @State private var showonboardScreen = false
    @AppStorage("ShowLog") var showLog = false
    @AppStorage("homeScreen") var homeScreen = false
    var body: some View {
        NavigationView {
            VStack{
                Image("img_virtuallearn logo_splash")
                
                if showLog{
                    NavigationLink(destination: LoginRegisterView(),isActive: $showLog){
                        EmptyView()
                    }
                }else if homeScreen {
                    NavigationLink(destination: HomeView(),isActive: $homeScreen){
                        EmptyView()
                    }
                }else{
                    NavigationLink(destination: OnboardingScreenView(), isActive: $showonboardScreen){
                        EmptyView()
                    }
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity,minHeight: 0,maxHeight: .infinity)
            .background(Color.accentColor)
        .edgesIgnoringSafeArea(.all)
        }
        .onAppear{
            if !showLog{
                DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                    showonboardScreen = true
                }
            }
        }
        .navigationBarHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
