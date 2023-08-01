//
//  NotificationView.swift
//  VertualLearnUIApp
//
//  Created by Harsha R Mundaragi  on 27/07/23.
//

import SwiftUI

struct NotificationView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack(alignment: .center, spacing: 0){
            
            HStack{
                VStack(alignment: .leading, spacing: 25){
                    Image(systemName: "arrow.left")
                        .font(.title2)
                        .onTapGesture {
                            presentationMode.wrappedValue.dismiss()
                        }
                    Text("Notification")
                        .font(.title)
                        .fontWeight(.medium)
                        .fontDesign(.rounded)
                }
                Spacer()
            }
            .padding(.top)
            .padding(.bottom, 40)
            
            HStack(alignment: .center){
                HStack(alignment: .top, spacing: 20){
                    Image("img_notify message_dp1")
                        .padding(.leading)
                    
                    VStack(alignment: .leading, spacing: 5){
                        Text("You scored 80% in Chapter 3 - Setting up a new project, of Course - Learn Figma - UI/UX Design Essential Training.")
                            .font(.footnote)
                            .fontWeight(.bold)
                            
                            .padding(.trailing, 40)
                        Text("2 MIN AGO")
                            .font(.system(size: 10))
                            .fontWeight(.medium)
                            .foregroundColor(.gray)
                    }
                    
                }
                .padding(.vertical)
                VStack(alignment: .center){
                    Circle()
                        .fill(.red)
                        .frame(width: 8, height:  8)
                }
                .padding(.trailing)
                    
            }
            .fontDesign(.rounded)
            .frame(width: UIScreen.screenWidth)
                .background(.blue.opacity(0.1))
            
            
            Spacer()
                .navigationBarHidden(true)
        }
        .padding(.horizontal)
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
